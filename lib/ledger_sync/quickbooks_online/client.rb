# frozen_string_literal: true

require_relative 'oauth_client'
require_relative 'dashboard_url_helper'

module LedgerSync
  module QuickBooksOnline
    class Client
      include Ledgers::Client::Mixin

      OAUTH_HEADERS     = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }.freeze
      ROOT_URI          = 'https://quickbooks.api.intuit.com'
      REVOKE_TOKEN_URI  = 'https://developer.api.intuit.com/v2/oauth2/tokens/revoke'
      ROOT_SANDBOX_URI  = 'https://sandbox-quickbooks.api.intuit.com'
      PRODUCTION_APP_URL_BASE = 'https://qbo.intuit.com/app'
      SANDBOX_APP_URL_BASE    = 'https://app.sandbox.qbo.intuit.com/app'

      attr_reader :access_token,
                  :client_id,
                  :client_secret,
                  :expires_at,
                  :previous_access_tokens,
                  :previous_refresh_tokens,
                  :realm_id,
                  :refresh_token,
                  :refresh_token_expires_at,
                  :root_uri,
                  :test,
                  :update_dotenv

      def initialize(args = {})
        @access_token = args.fetch(:access_token)
        @client_id = args.fetch(:client_id)
        @client_secret = args.fetch(:client_secret)
        @realm_id = args.fetch(:realm_id)
        @refresh_token = args.fetch(:refresh_token)
        @expires_at = args.fetch(:expires_at, nil)
        @refresh_token_expires_at = args.fetch(:refresh_token_expires_at, nil)
        @test = args.fetch(:test, false)
        @update_dotenv = args.fetch(:update_dotenv, true)

        @previous_access_tokens = []
        @previous_refresh_tokens = []

        @root_uri = (test ? ROOT_SANDBOX_URI : ROOT_URI)

        update_secrets_in_dotenv if update_dotenv

        super()
      end

      def authorization_url(redirect_uri:, state: SecureRandom.hex(12))
        oauth_client.authorization_url(redirect_uri: redirect_uri, state: state)
      end

      def find(path:)
        url = "#{oauth_base_uri}/#{path}"

        request(
          headers: OAUTH_HEADERS.dup,
          method: :get,
          url: url
        )
      end

      def oauth
        OAuth2::AccessToken.new(
          oauth_client.client,
          access_token,
          refresh_token: refresh_token
        )
      end

      def oauth_client
        OAuthClient.new(
          client_id: client_id,
          client_secret: client_secret
        )
      end

      def post(path:, payload:)
        url = "#{oauth_base_uri}/#{path}"

        request(
          headers: OAUTH_HEADERS.dup,
          method: :post,
          body: payload,
          url: url
        )
      end

      def query(query:, resource_class:, limit: 10, offset: 1)
        ledger_resource_type = self.class.ledger_resource_type_for(
          resource_class: resource_class
        ).classify
        full_query = "SELECT * FROM #{ledger_resource_type} WHERE #{query} STARTPOSITION #{offset} MAXRESULTS " \
                     "#{limit}"
        url = "#{oauth_base_uri}/query?query=#{CGI.escape(full_query)}"

        request(
          headers: OAUTH_HEADERS.dup,
          method: :get,
          url: url
        )
      end

      def refresh!
        set_credentials_from_oauth_token(
          token: Request.new(
            client: self
          ).refresh!
        )
        self
      end

      def revoke_token!
        headers = OAUTH_HEADERS.dup.merge(
          'Authorization' => "Basic #{Base64.strict_encode64("#{client_id}:#{client_secret}")}"
        )
        LedgerSync::Ledgers::Request.new(
          body: {
            token: access_token
          },
          headers: headers,
          method: :post,
          url: REVOKE_TOKEN_URI
        ).perform.status == 200
      end

      def set_credentials_from_oauth_code(code:, redirect_uri:, realm_id: nil)
        oauth_token = oauth_client.get_token(
          code: code,
          redirect_uri: redirect_uri
        )

        set_credentials_from_oauth_token(
          realm_id: realm_id,
          token: oauth_token
        )

        oauth_token
      end

      def url_for(resource:)
        DashboardURLHelper.new(
          resource: resource,
          base_url: (test ? SANDBOX_APP_URL_BASE : PRODUCTION_APP_URL_BASE)
        ).url
      end

      def self.ledger_attributes_to_save
        %i[access_token expires_at refresh_token refresh_token_expires_at]
      end

      def self.ledger_resource_type_overrides
        {
          Expense => 'purchase',
          LedgerClass => 'class',
          Preferences => 'preferences'
        }
      end

      def self.new_from_env(**override)
        new(
          {
            access_token: ENV.fetch('QUICKBOOKS_ONLINE_ACCESS_TOKEN'),
            client_id: ENV.fetch('QUICKBOOKS_ONLINE_CLIENT_ID'),
            client_secret: ENV.fetch('QUICKBOOKS_ONLINE_CLIENT_SECRET'),
            realm_id: ENV.fetch('QUICKBOOKS_ONLINE_REALM_ID'),
            refresh_token: ENV.fetch('QUICKBOOKS_ONLINE_REFRESH_TOKEN')
          }.merge(override)
        )
      end

      def self.new_from_oauth_client_uri(oauth_client:, uri:, **override)
        parsed_uri = OAuthClient::RedirectURIParser.new(uri: uri)
        oauth_token = oauth_client.get_token(
          code: parsed_uri.code,
          redirect_uri: parsed_uri.redirect_uri
        )

        new(
          {
            access_token: oauth_token.token,
            client_id: oauth_client.client_id,
            client_secret: oauth_client.client_secret,
            realm_id: parsed_uri.realm_id,
            refresh_token: oauth_token.refresh_token
          }.merge(override)
        )
      end

      private

      def oauth_base_uri
        @oauth_base_uri ||= "#{root_uri}/v3/company/#{realm_id}"
      end

      def request(method:, url:, body: nil, headers: {})
        Request.new(
          client: self,
          body: body,
          headers: headers,
          method: method,
          url: url
        ).perform
      end

      def set_credentials_from_oauth_token(token:, realm_id: nil)
        @previous_access_tokens << access_token if access_token.present?
        @access_token = token.token

        @expires_at = Time.at(token.expires_at.to_i).to_datetime
        unless token.params['x_refresh_token_expires_in'].nil?
          @refresh_token_expires_at = Time.at(
            Time.now.to_i + token.params['x_refresh_token_expires_in']
          ).to_datetime
        end

        @previous_refresh_tokens << refresh_token if refresh_token.present?
        @refresh_token = token.refresh_token

        @realm_id = realm_id unless realm_id.nil?
      ensure
        update_secrets_in_dotenv if update_dotenv
      end
    end
  end
end

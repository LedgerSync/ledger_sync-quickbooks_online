# frozen_string_literal: true

require 'spec_helper'

support :quickbooks_online_helpers

RSpec.describe LedgerSync::QuickBooksOnline::Client do
  include QuickBooksOnlineHelpers

  let(:access_token) { 'access_token' }
  let(:client_id) { 'client_id' }
  let(:client_secret) { 'client_secret' }
  let(:expires_at) { nil }
  let(:realm_id) { 'realm_id' }
  let(:refresh_token) { 'refresh_token' }
  let(:refresh_token_expires_at) { nil }
  let(:test) { true }
  let(:client) { quickbooks_online_client }

  subject do
    described_class.new(
      access_token: access_token,
      client_id: client_id,
      client_secret: client_secret,
      realm_id: realm_id,
      refresh_token: refresh_token,
      test: test
    )
  end

  describe '#find' do
    it { expect(subject).to respond_to(:find) }
  end

  describe '#ledger_attributes_to_save' do
    it do
      h = {
        access_token: access_token,
        expires_at: expires_at,
        refresh_token_expires_at: nil,
        refresh_token: refresh_token

      }
      expect(subject.ledger_attributes_to_save).to eq(h)
    end
  end

  describe '#post' do
    it { expect(subject).to respond_to(:post) }
  end

  describe '#query' do
    it { expect(subject).to respond_to(:query) }
  end

  describe '#refresh!' do
    it { expect(subject).to respond_to(:refresh!) }
    it do
      stub_client_refresh
      expect(subject.expires_at).to be_nil
      expect(subject.refresh_token_expires_at).to be_nil
      subject.refresh!
      expect(subject.expires_at).to be_a(DateTime)
      expect(subject.refresh_token_expires_at).to be_a(DateTime)
    end
  end

  describe '#revoke_token!' do
    it { expect(subject).to respond_to(:revoke_token!) }
    it 'revokes token', vcr: false do
      stub_revoke_token
      expect(subject.revoke_token!).to be_truthy
    end
  end

  describe '#url_for' do
    it do
      resource = LedgerSync::QuickBooksOnline::Account.new(ledger_id: 123)
      url = client.url_for(resource: resource)
      expect(url).to eq('https://app.sandbox.qbo.intuit.com/app/register?accountId=123')
    end

    it do
      resource = LedgerSync::QuickBooksOnline::Bill.new(ledger_id: 123)
      url = client.url_for(resource: resource)
      expect(url).to eq('https://app.sandbox.qbo.intuit.com/app/bill?txnId=123')
    end

    it do
      resource = LedgerSync::QuickBooksOnline::Customer.new(ledger_id: 123)
      url = client.url_for(resource: resource)
      expect(url).to eq('https://app.sandbox.qbo.intuit.com/app/customerdetail?nameId=123')
    end

    it do
      resource = LedgerSync::QuickBooksOnline::Deposit.new(ledger_id: 123)
      url = client.url_for(resource: resource)
      expect(url).to eq('https://app.sandbox.qbo.intuit.com/app/deposit?txnId=123')
    end

    it do
      resource = LedgerSync::QuickBooksOnline::Expense.new(ledger_id: 123)
      url = client.url_for(resource: resource)
      expect(url).to eq('https://app.sandbox.qbo.intuit.com/app/expense?txnId=123')
    end

    it do
      resource = LedgerSync::QuickBooksOnline::JournalEntry.new(ledger_id: 123)
      url = client.url_for(resource: resource)
      expect(url).to eq('https://app.sandbox.qbo.intuit.com/app/journal?txnId=123')
    end

    it do
      resource = LedgerSync::QuickBooksOnline::Payment.new(ledger_id: 123)
      url = client.url_for(resource: resource)
      expect(url).to eq('https://app.sandbox.qbo.intuit.com/app/recvpayment?txnId=123')
    end

    it do
      resource = LedgerSync::QuickBooksOnline::Transfer.new(ledger_id: 123)
      url = client.url_for(resource: resource)
      expect(url).to eq('https://app.sandbox.qbo.intuit.com/app/transfer?txnId=123')
    end

    it do
      resource = LedgerSync::QuickBooksOnline::Vendor.new(ledger_id: 123)
      url = client.url_for(resource: resource)
      expect(url).to eq('https://app.sandbox.qbo.intuit.com/app/vendordetail?nameId=123')
    end
  end

  describe '.ledger_attributes_to_save' do
    subject { described_class.ledger_attributes_to_save }

    it { expect(subject).to eq(%i[access_token expires_at refresh_token refresh_token_expires_at]) }
  end

  describe '.new_from_oauth_client_uri', vcr: true do
    it do
      oauth_client_uri =
        'http://localhost:3000/?code=THIS_IS_THE_OAUTH_CODE&state=1f14489339926f9ac94cb860&realmId=1234567890'
      redirect_uri = 'http://localhost:3000/accounting/'
      oauth_client = LedgerSync::QuickBooksOnline::OAuthClient.new(
        client_id: 'client_id',
        client_secret: 'client_secret'
      )
      client = described_class.new_from_oauth_client_uri(
        oauth_client: oauth_client,
        uri: oauth_client_uri
      )

      expect(client.access_token).to be_present
      expect(client.client_id).to eq(oauth_client.client_id)
      expect(client.realm_id).to be_present
      expect(client.refresh_token).to be_present

      state_token = SecureRandom.hex(12)
      authorization_url = oauth_client.authorization_url(redirect_uri: redirect_uri, state: state_token)
      expect(authorization_url).to include("state=#{state_token}")
    end
  end
end

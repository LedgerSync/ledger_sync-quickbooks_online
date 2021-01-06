# frozen_string_literal: true

require 'spec_helper'

support :quickbooks_online_helpers

RSpec.describe LedgerSync::QuickBooksOnline::Operation do
  include QuickBooksOnlineHelpers

  describe '#perform' do
    it do
      customer1 = LedgerSync::QuickBooksOnline::Customer.new(
        DisplayName: 'Customer 1',
        GivenName: '',
        FamilyName: '',
        MiddleName: ''
      )

      customer2 = LedgerSync::QuickBooksOnline::Customer.new(
        DisplayName: 'Customer 2',
        GivenName: '',
        FamilyName: '',
        MiddleName: ''
      )

      operation1 = LedgerSync::QuickBooksOnline::Customer::Operations::Create.new(
        client: quickbooks_online_client,
        resource: customer1
      )

      operation2 = LedgerSync::QuickBooksOnline::Customer::Operations::Create.new(
        client: quickbooks_online_client,
        resource: customer2
      )

      stub_customer_create(
        request_body: customer_request_body_hash.merge(
          'DisplayName' => 'Customer 1',
          'PrimaryEmailAddr' => nil,
          'GivenName' => '',
          'FamilyName' => '',
          'MiddleName' => ''
        )
      )
      result1 = operation1.perform
      expect(result1.response.request.body.fetch('DisplayName')).to eq('Customer 1')

      stub_customer_create(
        request_body: customer_request_body_hash.merge(
          'DisplayName' => 'Customer 2',
          'PrimaryEmailAddr' => nil,
          'GivenName' => '',
          'FamilyName' => '',
          'MiddleName' => ''
        )
      )
      result2 = operation2.perform
      expect(result2.response.request.body.fetch('DisplayName')).to eq('Customer 2')
    end
  end
end

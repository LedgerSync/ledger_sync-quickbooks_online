# frozen_string_literal: true

require 'spec_helper'

core_support :operation_shared_examples
support :quickbooks_online_helpers

RSpec.describe LedgerSync::QuickBooksOnline::Customer::Operations::Update do
  include QuickBooksOnlineHelpers

  let(:client) { quickbooks_online_client }

  let(:resource) do
    create(
      :quickbooks_online_customer,
      external_id: :ext_id,
      ledger_id: 123,
      GivenName: nil,
      FamilyName: nil,
      MiddleName: nil,
      PrimaryEmailAddr: create(
        :quickbooks_online_primary_email_addr,
        Address: 'test@example.com'
      ),
      PrimaryPhone: nil,
      DisplayName: 'Sample Customer'
    )
  end

  it_behaves_like 'an operation'
  it_behaves_like 'a successful operation',
                  stubs: %i[
                    stub_customer_find
                    stub_customer_update
                  ]
end

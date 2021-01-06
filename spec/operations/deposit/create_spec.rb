# frozen_string_literal: true

require 'spec_helper'

core_support :operation_shared_examples
support :quickbooks_online_helpers

RSpec.describe LedgerSync::QuickBooksOnline::Deposit::Operations::Create do
  include QuickBooksOnlineHelpers

  let(:account) do
    build(
      :quickbooks_online_account,
      external_id: :ext_id,
      ledger_id: '123'
    )
  end

  let(:entity) do
    build(
      :quickbooks_online_vendor,
      external_id: :ext_id,
      ledger_id: '123',
      DisplayName: 'Sample Vendor'
    )
  end

  let(:department) do
    build(
      :quickbooks_online_department,
      external_id: :ext_id,
      ledger_id: '123'
    )
  end

  let(:ledger_class) do
    build(
      :quickbooks_online_ledger_class,
      external_id: :ext_id,
      ledger_id: '123'
    )
  end

  let(:line_item1) do
    build(
      :quickbooks_online_deposit_line,
      Amount: 12_345,
      Description: 'Sample Transaction 1',
      DepositLineDetail: build(
        :quickbooks_online_deposit_line_detail,
        Account: account,
        Class: ledger_class,
        Entity: entity
      )
    )
  end

  let(:line_item2) do
    build(
      :quickbooks_online_deposit_line,
      Amount: 12_345,
      Description: 'Sample Transaction 2',
      DepositLineDetail: build(
        :quickbooks_online_deposit_line_detail,
        Account: account,
        Class: ledger_class,
        Entity: nil
      )
    )
  end

  let(:currency) do
    build(
      :quickbooks_online_currency,
      Name: 'United States Dollar',
      Symbol: 'USD'
    )
  end

  let(:resource) do
    build(
      :quickbooks_online_deposit,
      DepositToAccount: account,
      Department: department,
      Currency: currency,
      PrivateNote: 'Memo',
      ExchangeRate: 1.0,
      TxnDate: Date.parse('2019-09-01'),
      Line: [
        line_item1,
        line_item2
      ]
    )
  end

  let(:client) { quickbooks_online_client }

  it_behaves_like 'an operation'
  it_behaves_like 'a successful operation', stubs: :stub_deposit_create
end

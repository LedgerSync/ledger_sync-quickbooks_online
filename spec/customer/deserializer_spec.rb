# frozen_string_literal: true

require 'spec_helper'

RSpec.describe LedgerSync::QuickBooksOnline::Customer::Deserializer do
  let(:customer) do
    build(
      :quickbooks_online_customer,
      ledger_id: id,
      DisplayName: name,
      PrimaryPhone: create(
        :quickbooks_online_primary_phone,
        FreeFormNumber: phone_number
      ),
      PrimaryEmailAddr: create(
        :quickbooks_online_primary_email_addr,
        Address: email
      )
    )
  end
  let(:id) { '123' }
  let(:name) { 'test_name' }
  let(:email) { 'test_email' }
  let(:phone_number) { 'test_phone_number' }

  let(:h) do
    {
      'DisplayName' => name,
      'Id' => id,
      'PrimaryPhone' => {
        'FreeFormNumber' => phone_number
      },
      'PrimaryEmailAddr' => {
        'Address' => email
      }
    }
  end

  describe '#deserialize' do
    let(:customer) { LedgerSync::QuickBooksOnline::Customer.new }

    it do
      deserializer = described_class.new
      deserialized_customer = deserializer.deserialize(hash: h, resource: customer)
      expect(customer.PrimaryEmailAddr).to be_nil
      expect(customer.DisplayName).to be_nil
      expect(customer.PrimaryPhone).to be_nil
      expect(deserialized_customer.PrimaryEmailAddr.Address).to eq(email)
      expect(deserialized_customer.DisplayName).to eq(name)
      expect(deserialized_customer.PrimaryPhone.FreeFormNumber).to eq(phone_number)
    end
  end
end

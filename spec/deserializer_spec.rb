# frozen_string_literal: true

require 'spec_helper'

support :serialization_helpers

RSpec.describe LedgerSync::QuickBooksOnline::Deserializer do
  include SerializationHelpers

  let(:bill_hash_from_quickbooks) do
    {
      'SyncToken' => '2',
      'domain' => 'QBO',
      'APAccountRef' => {
        'name' => 'Accounts Payable (A/P)',
        'value' => '33'
      },
      'VendorRef' => {
        'name' => 'Norton Lumber and Building Materials',
        'value' => '46'
      },
      'TxnDate' => '2014-11-06',
      'TotalAmt' => 103.55,
      'CurrencyRef' => {
        'name' => 'United States Dollar',
        'value' => 'USD'
      },
      'LinkedTxn' => [
        {
          'TxnId' => '118',
          'TxnType' => 'BillPaymentCheck'
        }
      ],
      'SalesTermRef' => {
        'value' => '3'
      },
      'DueDate' => '2014-12-06',
      'sparse' => false,
      'Line' => [
        {
          'DetailType' => 'AccountBasedExpenseLineDetail',
          'Amount' => 103.55,
          'Id' => '1',
          'AccountBasedExpenseLineDetail' => {
            'TaxCodeRef' => {
              'value' => 'TAX'
            },
            'AccountRef' => {
              'name' => 'Job Expenses:Job Materials:Decks and Patios',
              'value' => '64'
            },
            'BillableStatus' => 'Billable',
            'CustomerRef' => {
              'name' => 'Travis Waldron',
              'value' => '26'
            }
          },
          'Description' => 'Lumber 1'
        },
        {
          'DetailType' => 'AccountBasedExpenseLineDetail',
          'Amount' => 103.55,
          'Id' => '2',
          'AccountBasedExpenseLineDetail' => {
            'TaxCodeRef' => {
              'value' => 'TAX'
            },
            'AccountRef' => {
              'name' => 'Job Expenses:Job Materials:Decks and Patios',
              'value' => '64'
            },
            'BillableStatus' => 'Billable',
            'CustomerRef' => {
              'name' => 'Travis Waldron',
              'value' => '26'
            }
          },
          'Description' => 'Lumber 2'
        }
      ],
      'Balance' => 0,
      'Id' => '25',
      'MetaData' => {
        'CreateTime' => '2014-11-06T15:37:25-08:00',
        'LastUpdatedTime' => '2015-02-09T10:11:11-08:00'
      }
    }
  end

  let(:local_bill) do
    LedgerSync::QuickBooksOnline::Bill.new(
      Line: [
        LedgerSync::QuickBooksOnline::BillLine.new(
          ledger_id: 1
        ),
        LedgerSync::QuickBooksOnline::BillLine.new(
          Description: 'Testing 3'
        )
      ]
    )
  end

  describe '#deserialize' do
    it 'merges using replace by default' do
      serializer_class = LedgerSync::QuickBooksOnline::Bill::Serializer
      deserializer_class = LedgerSync::QuickBooksOnline::Bill::Deserializer
      merged_resource = deserializer_class.new.deserialize(
        hash: bill_hash_from_quickbooks,
        resource: local_bill
      )

      serialized_line_items = [
        {
          'DetailType' => 'AccountBasedExpenseLineDetail',
          'Amount' => 103.55,
          'Id' => '1',
          'AccountBasedExpenseLineDetail' => {
            'AccountRef' => {
              'value' => '64'
            },
            'ClassRef' => nil
          },
          'Description' => 'Lumber 1'
        },
        {
          'DetailType' => 'AccountBasedExpenseLineDetail',
          'Amount' => 103.55,
          'Id' => '2',
          'AccountBasedExpenseLineDetail' => {
            'AccountRef' => {
              'value' => '64'
            },
            'ClassRef' => nil
          },
          'Description' => 'Lumber 2'
        }
      ]
      line = serializer_class.new.serialize(resource: merged_resource)['Line']
      expect(line).to eq(serialized_line_items.map { |e| e })
    end

    it 'merges to support quickbooks line items' do
      # merge_into needs for references_many needs to look for the
      # resource with that ID and merge the changes for the resource
      # into the returned hash.
      #
      # If many item does not exist on local resource, consider it a delete and ignore.
      #
      # If item on resource does not have ID or is not found in response, we consider it a create.

      serializer_class = LedgerSync::QuickBooksOnline::Bill::Serializer
      deserializer_class = LedgerSync::QuickBooksOnline::Bill::Deserializer

      merged_resource = deserializer_class.new.deserialize(
        hash: bill_hash_from_quickbooks,
        merge_for_full_update: true,
        resource: local_bill
      )

      serialized_line_items = [
        {
          'DetailType' => 'AccountBasedExpenseLineDetail',
          'Amount' => 103.55,
          'Id' => '1',
          'AccountBasedExpenseLineDetail' => {
            'AccountRef' => {
              'value' => '64'
            },
            'ClassRef' => nil
          },
          'Description' => 'Lumber 1'
        },
        {
          'DetailType' => 'AccountBasedExpenseLineDetail',
          'Amount' => nil,
          'Id' => nil,
          'AccountBasedExpenseLineDetail' => nil,
          'Description' => 'Testing 3'
        }
      ]
      line = serializer_class.new.serialize(resource: merged_resource)['Line']
      expect(line).to eq(serialized_line_items.map { |e| e })
    end
  end
end

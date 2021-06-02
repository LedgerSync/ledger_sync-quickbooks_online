# frozen_string_literal: true

require_relative '../reference/deserializer'

module LedgerSync
  module QuickBooksOnline
    class DepositLineDetail
      class Deserializer < QuickBooksOnline::Deserializer
        references_one :Account,
                       hash_attribute: 'AccountRef',
                       deserializer: Reference::Deserializer

        references_one :Class,
                       hash_attribute: 'ClassRef',
                       deserializer: Reference::Deserializer

        attribute(:Entity) do |args = {}|
          hash = args.fetch(:hash)
          value = hash.fetch('Entity', nil)

          unless value.nil?
            Customer.new(
              ledger_id: value['value'],
              DisplayName: value['name']
            )
          end
        end
      end
    end
  end
end

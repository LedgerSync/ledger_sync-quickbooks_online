# frozen_string_literal: true

module LedgerSync
  module QuickBooksOnline
    class Reference
      class Serializer < QuickBooksOnline::Serializer
        attribute :value, resource_attribute: :ledger_id
      end
    end
  end
end

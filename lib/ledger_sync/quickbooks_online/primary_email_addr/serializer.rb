# frozen_string_literal: true

module LedgerSync
  module QuickBooksOnline
    class PrimaryEmailAddr
      class Serializer < QuickBooksOnline::Serializer
        attribute :Address
      end
    end
  end
end

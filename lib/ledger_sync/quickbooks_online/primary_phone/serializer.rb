# frozen_string_literal: true

module LedgerSync
  module QuickBooksOnline
    class PrimaryPhone
      class Serializer < QuickBooksOnline::Serializer
        attribute :FreeFormNumber
      end
    end
  end
end

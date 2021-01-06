# frozen_string_literal: true

module LedgerSync
  module QuickBooksOnline
    class PrimaryPhone
      class Deserializer < QuickBooksOnline::Deserializer
        attribute :FreeFormNumber
      end
    end
  end
end

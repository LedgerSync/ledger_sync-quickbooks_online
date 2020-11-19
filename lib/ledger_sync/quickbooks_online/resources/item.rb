# frozen_string_literal: true

module LedgerSync
  module QuickBooksOnline
    class Item < QuickBooksOnline::Resource
      attribute :Name, type: Type::String
    end
  end
end

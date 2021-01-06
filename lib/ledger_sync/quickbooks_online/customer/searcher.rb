# frozen_string_literal: true

module LedgerSync
  module QuickBooksOnline
    class Customer
      class Searcher < Searcher
        def query_string
          "DisplayName LIKE '%#{query}%'"
        end
      end
    end
  end
end

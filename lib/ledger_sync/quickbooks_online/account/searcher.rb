# frozen_string_literal: true

module LedgerSync
  module QuickBooksOnline
    class Account
      class Searcher < Searcher
        def query_string
          "Name LIKE '%#{query}%'"
        end
      end
    end
  end
end

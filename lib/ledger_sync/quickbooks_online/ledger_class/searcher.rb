# frozen_string_literal: true

module LedgerSync
  module QuickBooksOnline
    class LedgerClass
      class Searcher < Searcher
        def query_string
          "Name LIKE '%#{query}%'"
        end
      end
    end
  end
end

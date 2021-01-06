# frozen_string_literal: true

module LedgerSync
  module QuickBooksOnline
    class Department
      class Searcher < Searcher
        private

        def query_string
          @query_string ||= "Name LIKE '%#{query}%'"
        end
      end
    end
  end
end

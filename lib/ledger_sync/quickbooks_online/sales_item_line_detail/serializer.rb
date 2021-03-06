# frozen_string_literal: true

require_relative '../reference/serializer'

module LedgerSync
  module QuickBooksOnline
    class SalesItemLineDetail
      class Serializer < QuickBooksOnline::Serializer
        references_one 'ItemRef',
                       resource_attribute: :Item,
                       serializer: Reference::Serializer

        references_one 'ClassRef',
                       resource_attribute: :Class,
                       serializer: Reference::Serializer
      end
    end
  end
end

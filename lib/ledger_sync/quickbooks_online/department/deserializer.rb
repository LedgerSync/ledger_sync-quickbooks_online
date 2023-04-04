# frozen_string_literal: true

require_relative '../reference/deserializer'

module LedgerSync
  module QuickBooksOnline
    class Department
      class Deserializer < QuickBooksOnline::Deserializer
        id

        attribute :Name
        attribute :Active
        attribute :SubDepartment
        attribute :FullyQualifiedName

        references_one :Parent,
                       hash_attribute: 'ParentRef',
                       deserializer: Reference::Deserializer
      end
    end
  end
end

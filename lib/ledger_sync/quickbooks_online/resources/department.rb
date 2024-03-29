# frozen_string_literal: true

module LedgerSync
  module QuickBooksOnline
    class Department < QuickBooksOnline::Resource
      attribute :Name, type: Type::String
      attribute :FullyQualifiedName, type: Type::String
      attribute :Active, type: Type::Boolean
      attribute :SubDepartment, type: Type::Boolean

      references_one :Parent, to: Department

      def name
        self.Name
      end
    end
  end
end

# frozen_string_literal: true

module LedgerSync
  module QuickBooksOnline
    class Vendor
      module Operations
        class Create < Operation::Create
          class Contract < LedgerSync::Ledgers::Contract
            params do
              required(:external_id).maybe(:string)
              required(:ledger_id).value(:nil)
              optional(:CompanyName).maybe(:string)
              optional(:DisplayName).maybe(:string)
              optional(:FamilyName).maybe(:string)
              optional(:GivenName).maybe(:string)
              optional(:MiddleName).maybe(:string)
              required(:PrimaryPhone).maybe(:hash, Types::Reference)
              required(:PrimaryEmailAddr).maybe(:hash, Types::Reference)
            end
          end
        end
      end
    end
  end
end

# frozen_string_literal: true

module LedgerSync
  module QuickBooksOnline
    class BillPaymentLine
      class Deserializer < QuickBooksOnline::Deserializer
        amount :Amount

        attribute :LinkedTxn,
                  type: Serialization::Type::DeserializeTransactionReferenceType.new
      end
    end
  end
end

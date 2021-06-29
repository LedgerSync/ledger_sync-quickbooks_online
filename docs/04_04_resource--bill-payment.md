## LedgerSync::QuickBooksOnline::BillPayment

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| amount | LedgerSync::Type::Integer |
| memo | LedgerSync::Type::String |
| transaction_date | LedgerSync::Type::Date |
| exchange_rate | LedgerSync::Type::Float |
| reference_number | LedgerSync::Type::String |
| payment_type | LedgerSync::Type::StringFromSet |
| account | LedgerSync::Type::ReferenceOne |
| currency | LedgerSync::Type::ReferenceOne |
| department | LedgerSync::Type::ReferenceOne |
| vendor | LedgerSync::Type::ReferenceOne |
| bank_account | LedgerSync::Type::ReferenceOne |
| credit_card_account | LedgerSync::Type::ReferenceOne |
| line_items | LedgerSync::Type::ReferenceMany |

## LedgerSync::QuickBooksOnline::Expense

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| memo | LedgerSync::Type::String |
| payment_type | LedgerSync::Type::StringFromSet |
| transaction_date | LedgerSync::Type::Date |
| exchange_rate | LedgerSync::Type::Float |
| reference_number | LedgerSync::Type::String |
| entity | LedgerSync::Type::ReferenceOne |
| account | LedgerSync::Type::ReferenceOne |
| department | LedgerSync::Type::ReferenceOne |
| currency | LedgerSync::Type::ReferenceOne |
| line_items | LedgerSync::Type::ReferenceMany |

## LedgerSync::QuickBooksOnline::JournalEntry

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| memo | LedgerSync::Type::String |
| transaction_date | LedgerSync::Type::Date |
| reference_number | LedgerSync::Type::String |
| currency | LedgerSync::Type::ReferenceOne |
| line_items | LedgerSync::Type::ReferenceMany |

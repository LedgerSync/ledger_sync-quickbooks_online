## LedgerSync::QuickBooksOnline::Transfer

### Attributes

| Name | Type |
| ---- | ---- |
| external_id | LedgerSync::Type::ID |
| ledger_id | LedgerSync::Type::ID |
| amount | LedgerSync::Type::Integer |
| memo | LedgerSync::Type::String |
| transaction_date | LedgerSync::Type::Date |
| from_account | LedgerSync::Type::ReferenceOne |
| to_account | LedgerSync::Type::ReferenceOne |
| currency | LedgerSync::Type::ReferenceOne |

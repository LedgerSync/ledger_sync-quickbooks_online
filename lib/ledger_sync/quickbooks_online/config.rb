# frozen_string_literal: true

require_relative 'client'

args = {
  base_module: LedgerSync::QuickBooksOnline,
  root_path: 'ledger_sync/quickbooks_online'
}

LedgerSync.register_ledger(:quickbooks_online, args) do |config|
  config.name = 'QuickBooks Online'
  config.add_alias :qbo
  config.add_alias :quick_books_online
  config.rate_limiting_wait_in_seconds = 60
end

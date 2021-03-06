# frozen_string_literal: true

require 'dotenv'

require 'ledger_sync/test/support'
require 'climate_control'

LedgerSync::Test::Support.setup('ledger_sync/quickbooks_online')

support :vcr

setup_client_qa_support(LedgerSync::QuickBooksOnline::Client)

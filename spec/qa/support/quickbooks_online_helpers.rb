# frozen_string_literal: true

core_qa_support :ledger_helpers
qa_support :quickbooks_online_shared_examples

module QA
  module QuickBooksOnlineHelpers
    include LedgerSync::Test::QA::LedgerHelpers

    def client_class
      LedgerSync::QuickBooksOnline::Client
    end

    def quickbooks_online_client
      @quickbooks_online_client ||= client_class.new_from_env(test: true)
    end
  end
end

RSpec.configure do |config|
  config.include QA::QuickBooksOnlineHelpers, qa: true
end

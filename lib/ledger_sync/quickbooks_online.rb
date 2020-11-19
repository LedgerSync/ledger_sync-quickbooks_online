# frozen_string_literal: true

require 'ledger_sync'

module LedgerSync
  module QuickBooksOnline
    def self.root(*paths)
      File.join(File.expand_path('../..', __dir__), *paths.map(&:to_s))
    end
  end
end

require_relative 'quickbooks_online/config'

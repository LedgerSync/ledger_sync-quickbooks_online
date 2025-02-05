# frozen_string_literal: true

# :nocov:
module LedgerSync
  module QuickBooksOnline
    VERSION = '2.0.0'

    def self.version(args = {})
      pre = args.fetch(:pre, false)

      if !pre && (!ENV['TRAVIS'] || ENV.fetch('TRAVIS_TAG', '') != '')
        VERSION
      else
        "#{VERSION}.pre.#{ENV.fetch('TRAVIS_BUILD_NUMBER', nil)}"
      end
    end
  end
end
# :nocov:

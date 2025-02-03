# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ledger_sync/quickbooks_online/version'

Gem::Specification.new do |spec|
  spec.name = 'ledger_sync-quickbooks_online'
  spec.version = LedgerSync::QuickBooksOnline::VERSION
  spec.authors = ['Modern Treasury']
  spec.email = ['ledgersync@moderntreasury.com']

  spec.required_ruby_version = '>= 3.1.6'

  spec.summary = 'Sync common objects to accounting software.'
  spec.description = 'LedgerSync is a simple library that allows you to sync common objects to popular accounting ' \
                     'software like QuickBooks Online, QuickBooksOnline, NetSuite, etc.'
  spec.homepage = 'https://www.ledgersync.dev'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency('awesome_print', '>= 0')
  spec.add_development_dependency('bump', '~> 0.10.0')
  spec.add_development_dependency('bundler', '~> 2.1')
  spec.add_development_dependency('byebug', '>= 0')
  spec.add_development_dependency('climate_control', '>= 0')
  spec.add_development_dependency('coveralls_reborn', '>= 0')
  spec.add_development_dependency('factory_bot', '~> 6.1.0')
  spec.add_development_dependency('overcommit', '~> 0.57.0')
  spec.add_development_dependency('rake', '~> 13.0')
  spec.add_development_dependency('rspec', '~> 3.2')
  spec.add_development_dependency('rubocop', '>= 0')
  spec.add_development_dependency('simplecov-lcov', '>= 0')
  spec.add_development_dependency('vcr', '>= 0')
  spec.add_development_dependency('webmock', '>= 0')
  spec.add_dependency('dotenv')
  spec.add_dependency('ledger_sync', '>= 3.0', '<= 4.0')
  # spec.add_runtime_dependency('nokogiri', '>= 0')
  spec.add_dependency('oauth2', '>= 0')
  spec.metadata['rubygems_mfa_required'] = 'true'
end

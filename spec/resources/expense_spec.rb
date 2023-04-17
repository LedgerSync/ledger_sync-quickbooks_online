# frozen_string_literal: true

require 'spec_helper'

RSpec.describe LedgerSync::QuickBooksOnline::Expense do
  describe '#entity' do
    it do
      expect { described_class.new(Entity: LedgerSync::QuickBooksOnline::Customer.new) }.not_to raise_error
    end

    it do
      expect { described_class.new(Entity: LedgerSync::QuickBooksOnline::Vendor.new) }.not_to raise_error
    end

    it do
      expect { described_class.new(Entity: LedgerSync::QuickBooksOnline::Bill.new) }.to raise_error(
        LedgerSync::ResourceAttributeError::TypeError,
        'Attribute Entity for LedgerSync::QuickBooksOnline::Expense should be one of the following: ' \
        'LedgerSync::QuickBooksOnline::Customer, LedgerSync::QuickBooksOnline::Vendor.  ' \
        'Given LedgerSync::QuickBooksOnline::Bill'
      )
    end
  end
end

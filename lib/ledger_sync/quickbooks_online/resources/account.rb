# frozen_string_literal: true

require_relative 'currency'

module LedgerSync
  module QuickBooksOnline
    class Account < QuickBooksOnline::Resource
      TYPES = {
        'bank' => 'Bank',
        'other_current_assets' => 'Other Current Asset',
        'fixed_asset' => 'Fixed Asset',
        'other_asset' => 'Other Asset',
        'accounts_receivable' => 'Accounts Receivable',
        'equity' => 'Equity',
        'expense' => 'Expense',
        'other_expense' => 'Other Expense',
        'cost_of_goods_sold' => 'Cost of Goods Sold',
        'accounts_payable' => 'Accounts Payable',
        'credit_card' => 'Credit Card',
        'long_term_liability' => 'Long Term Liability',
        'other_current_liability' => 'Other Current Liability',
        'income' => 'Income',
        'other_income' => 'Other Income'
      }.freeze

      TYPES_TO_CLASSIFICATION_MAPPING = {
        'bank' => 'asset',
        'other_current_assets' => 'asset',
        'fixed_asset' => 'asset',
        'other_asset' => 'asset',
        'accounts_receivable' => 'asset',
        'equity' => 'equity',
        'expense' => 'expense',
        'other_expense' => 'expense',
        'cost_of_goods_sold' => 'expense',
        'accounts_payable' => 'liability',
        'credit_card' => 'liability',
        'long_term_liability' => 'liability',
        'other_current_liability' => 'liability',
        'income' => 'revenue',
        'other_income' => 'revenue'
      }.freeze

      CLASSIFICATIONS = {
        'asset' => 'Asset',
        'equity' => 'Equity',
        'expense' => 'Expense',
        'liability' => 'Liability',
        'revenue' => 'Revenue'
      }.freeze

      attribute :Name, type: Type::String
      attribute :Classification, type: Type::String
      attribute :AccountType, type: Type::StringFromSet.new(values: TYPES.keys)
      attribute :AccountSubType, type: Type::String
      attribute :AcctNum, type: Type::String
      attribute :Description, type: Type::String
      attribute :Active, type: Type::Boolean

      references_one :Currency, to: Currency

      def name
        self.Name
      end
    end
  end
end

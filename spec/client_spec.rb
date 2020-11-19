# frozen_string_literal: true

require 'spec_helper'

support :quickbooks_online_helpers

RSpec.describe LedgerSync::QuickBooksOnline::Client do
  include QuickBooksOnlineHelpers

  let(:api_key) { 'api_key' }
  let(:client) { quickbooks_online_client }
  let(:initialized_client) do
    described_class.new(
      api_key: api_key
    )
  end

  subject { initialized_client }

  describe '#find' do
    it { expect(subject).to respond_to(:find) }
  end

  describe '#ledger_attributes_to_save' do
    it do
      h = {
        api_key: api_key
      }
      expect(subject.ledger_attributes_to_save).to eq(h)
    end
  end

  describe '#post' do
    it { expect(subject).to respond_to(:post) }
  end

  describe '.ledger_attributes_to_save' do
    subject { described_class.ledger_attributes_to_save }

    it { expect(subject).to eq(%i[api_key]) }
  end
end

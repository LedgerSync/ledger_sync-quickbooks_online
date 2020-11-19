# frozen_string_literal: true

require 'spec_helper'

RSpec.describe LedgerSync::QuickBooksOnline::SampleResource, qa: true do
  let(:client) { quickbooks_online_client }
  let(:attribute_updates) do
    {
      Name: "QA UPDATE #{test_run_id}"
    }
  end
  # let(:record) { :sample_resource }
  let(:resource) do
    LedgerSync::QuickBooksOnline::SampleResource.new(
      Email: "#{test_run_id}@example.com",
      Name: "Test SampleResource #{test_run_id}"
    )
  end

  it_behaves_like 'a full quickbooks_online resource'
end

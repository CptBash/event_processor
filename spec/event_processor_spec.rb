# frozen_string_literal: true

# TODO: write tests for the event processor
RSpec.describe EventProcessor do
  it "has a version number" do
    expect(EventProcessor::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end

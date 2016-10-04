require "test_helper"

describe Part do
  let(:part) { Part.new }

  it "must be valid" do
    value(part).must_be :valid?
  end
end

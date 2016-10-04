require "test_helper"

describe Year do
  let(:year) { Year.new }

  it "must be valid" do
    value(year).must_be :valid?
  end
end

require "test_helper"

describe Template do
  let(:template) { Template.new }

  it "must be valid" do
    value(template).must_be :valid?
  end
end

require "test_helper"

describe InputType do
  let(:input_type) { InputType.new }

  it "must be valid" do
    value(input_type).must_be :valid?
  end
end

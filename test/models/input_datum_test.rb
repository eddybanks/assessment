require "test_helper"

describe InputDatum do
  let(:input_datum) { InputDatum.new }

  it "must be valid" do
    value(input_datum).must_be :valid?
  end
end

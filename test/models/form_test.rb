require "test_helper"

describe Form do
  let(:form) { Form.new }

  it "must be valid" do
    value(form).must_be :valid?
  end
end

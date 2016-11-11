require "test_helper"

describe Faq do
  let(:faq) { Faq.new }

  it "must be valid" do
    value(faq).must_be :valid?
  end
end

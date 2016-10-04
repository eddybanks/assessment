require "test_helper"

describe AssessmentSubtype do
  let(:assessment_subtype) { AssessmentSubtype.new }

  it "must be valid" do
    value(assessment_subtype).must_be :valid?
  end
end

require "test_helper"

describe AssessmentUnit do
  let(:assessment_unit) { AssessmentUnit.new }

  it "must be valid" do
    value(assessment_unit).must_be :valid?
  end
end

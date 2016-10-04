require "test_helper"

describe AssessmentType do
  let(:assessment_type) { AssessmentType.new }

  it "must be valid" do
    value(assessment_type).must_be :valid?
  end
end

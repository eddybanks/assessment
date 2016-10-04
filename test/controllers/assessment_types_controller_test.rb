require "test_helper"

describe AssessmentTypesController do
  let(:assessment_type) { assessment_types :one }

  it "gets index" do
    get assessment_types_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_assessment_type_url
    value(response).must_be :success?
  end

  it "creates assessment_type" do
    expect {
      post assessment_types_url, params: { assessment_type: { description: assessment_type.description, name: assessment_type.name } }
    }.must_change "AssessmentType.count"

    must_redirect_to assessment_type_path(AssessmentType.last)
  end

  it "shows assessment_type" do
    get assessment_type_url(assessment_type)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_assessment_type_url(assessment_type)
    value(response).must_be :success?
  end

  it "updates assessment_type" do
    patch assessment_type_url(assessment_type), params: { assessment_type: { description: assessment_type.description, name: assessment_type.name } }
    must_redirect_to assessment_type_path(assessment_type)
  end

  it "destroys assessment_type" do
    expect {
      delete assessment_type_url(assessment_type)
    }.must_change "AssessmentType.count", -1

    must_redirect_to assessment_types_path
  end
end

require "test_helper"

describe AssessmentSubtypesController do
  let(:assessment_subtype) { assessment_subtypes :one }

  it "gets index" do
    get assessment_subtypes_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_assessment_subtype_url
    value(response).must_be :success?
  end

  it "creates assessment_subtype" do
    expect {
      post assessment_subtypes_url, params: { assessment_subtype: { description: assessment_subtype.description, name: assessment_subtype.name } }
    }.must_change "AssessmentSubtype.count"

    must_redirect_to assessment_subtype_path(AssessmentSubtype.last)
  end

  it "shows assessment_subtype" do
    get assessment_subtype_url(assessment_subtype)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_assessment_subtype_url(assessment_subtype)
    value(response).must_be :success?
  end

  it "updates assessment_subtype" do
    patch assessment_subtype_url(assessment_subtype), params: { assessment_subtype: { description: assessment_subtype.description, name: assessment_subtype.name } }
    must_redirect_to assessment_subtype_path(assessment_subtype)
  end

  it "destroys assessment_subtype" do
    expect {
      delete assessment_subtype_url(assessment_subtype)
    }.must_change "AssessmentSubtype.count", -1

    must_redirect_to assessment_subtypes_path
  end
end

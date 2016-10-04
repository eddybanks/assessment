require "test_helper"

describe AssessmentUnitsController do
  let(:assessment_unit) { assessment_units :one }

  it "gets index" do
    get assessment_units_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_assessment_unit_url
    value(response).must_be :success?
  end

  it "creates assessment_unit" do
    expect {
      post assessment_units_url, params: { assessment_unit: { description: assessment_unit.description, name: assessment_unit.name } }
    }.must_change "AssessmentUnit.count"

    must_redirect_to assessment_unit_path(AssessmentUnit.last)
  end

  it "shows assessment_unit" do
    get assessment_unit_url(assessment_unit)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_assessment_unit_url(assessment_unit)
    value(response).must_be :success?
  end

  it "updates assessment_unit" do
    patch assessment_unit_url(assessment_unit), params: { assessment_unit: { description: assessment_unit.description, name: assessment_unit.name } }
    must_redirect_to assessment_unit_path(assessment_unit)
  end

  it "destroys assessment_unit" do
    expect {
      delete assessment_unit_url(assessment_unit)
    }.must_change "AssessmentUnit.count", -1

    must_redirect_to assessment_units_path
  end
end

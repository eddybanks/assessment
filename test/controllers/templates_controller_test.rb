require "test_helper"

describe TemplatesController do
  let(:template) { templates :one }

  it "gets index" do
    get templates_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_template_url
    value(response).must_be :success?
  end

  it "creates template" do
    expect {
      post templates_url, params: { template: { assessment_type_id: template.assessment_type_id, description: template.description, name: template.name, year_id: template.year_id } }
    }.must_change "Template.count"

    must_redirect_to template_path(Template.last)
  end

  it "shows template" do
    get template_url(template)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_template_url(template)
    value(response).must_be :success?
  end

  it "updates template" do
    patch template_url(template), params: { template: { assessment_type_id: template.assessment_type_id, description: template.description, name: template.name, year_id: template.year_id } }
    must_redirect_to template_path(template)
  end

  it "destroys template" do
    expect {
      delete template_url(template)
    }.must_change "Template.count", -1

    must_redirect_to templates_path
  end
end

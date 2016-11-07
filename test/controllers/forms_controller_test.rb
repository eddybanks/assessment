require "test_helper"

describe FormsController do
  let(:form) { forms :one }

  it "gets index" do
    get forms_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_form_url
    value(response).must_be :success?
  end

  it "creates form" do
    expect {
      post forms_url, params: { form: { description: form.description, name: form.name, template_id: form.template_id, year_id: form.year_id } }
    }.must_change "Form.count"

    must_redirect_to form_path(Form.last)
  end

  it "shows form" do
    get form_url(form)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_form_url(form)
    value(response).must_be :success?
  end

  it "updates form" do
    patch form_url(form), params: { form: { description: form.description, name: form.name, template_id: form.template_id, year_id: form.year_id } }
    must_redirect_to form_path(form)
  end

  it "destroys form" do
    expect {
      delete form_url(form)
    }.must_change "Form.count", -1

    must_redirect_to forms_path
  end
end

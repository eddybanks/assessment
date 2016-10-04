require "test_helper"

describe InputTypesController do
  let(:input_type) { input_types :one }

  it "gets index" do
    get input_types_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_input_type_url
    value(response).must_be :success?
  end

  it "creates input_type" do
    expect {
      post input_types_url, params: { input_type: { name: input_type.name } }
    }.must_change "InputType.count"

    must_redirect_to input_type_path(InputType.last)
  end

  it "shows input_type" do
    get input_type_url(input_type)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_input_type_url(input_type)
    value(response).must_be :success?
  end

  it "updates input_type" do
    patch input_type_url(input_type), params: { input_type: { name: input_type.name } }
    must_redirect_to input_type_path(input_type)
  end

  it "destroys input_type" do
    expect {
      delete input_type_url(input_type)
    }.must_change "InputType.count", -1

    must_redirect_to input_types_path
  end
end

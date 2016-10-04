require "test_helper"

describe InputDataController do
  let(:input_datum) { input_data :one }

  it "gets index" do
    get input_data_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_input_datum_url
    value(response).must_be :success?
  end

  it "creates input_datum" do
    expect {
      post input_data_url, params: { input_datum: { content: input_datum.content } }
    }.must_change "InputDatum.count"

    must_redirect_to input_datum_path(InputDatum.last)
  end

  it "shows input_datum" do
    get input_datum_url(input_datum)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_input_datum_url(input_datum)
    value(response).must_be :success?
  end

  it "updates input_datum" do
    patch input_datum_url(input_datum), params: { input_datum: { content: input_datum.content } }
    must_redirect_to input_datum_path(input_datum)
  end

  it "destroys input_datum" do
    expect {
      delete input_datum_url(input_datum)
    }.must_change "InputDatum.count", -1

    must_redirect_to input_data_path
  end
end

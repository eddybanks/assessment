require "test_helper"

describe PartsController do
  let(:part) { parts :one }

  it "gets index" do
    get parts_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_part_url
    value(response).must_be :success?
  end

  it "creates part" do
    expect {
      post parts_url, params: { part: { description: part.description, name: part.name } }
    }.must_change "Part.count"

    must_redirect_to part_path(Part.last)
  end

  it "shows part" do
    get part_url(part)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_part_url(part)
    value(response).must_be :success?
  end

  it "updates part" do
    patch part_url(part), params: { part: { description: part.description, name: part.name } }
    must_redirect_to part_path(part)
  end

  it "destroys part" do
    expect {
      delete part_url(part)
    }.must_change "Part.count", -1

    must_redirect_to parts_path
  end
end

require "test_helper"

describe ItemsController do
  let(:item) { items :one }

  it "gets index" do
    get items_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_item_url
    value(response).must_be :success?
  end

  it "creates item" do
    expect {
      post items_url, params: { item: { description: item.description, name: item.name } }
    }.must_change "Item.count"

    must_redirect_to item_path(Item.last)
  end

  it "shows item" do
    get item_url(item)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_item_url(item)
    value(response).must_be :success?
  end

  it "updates item" do
    patch item_url(item), params: { item: { description: item.description, name: item.name } }
    must_redirect_to item_path(item)
  end

  it "destroys item" do
    expect {
      delete item_url(item)
    }.must_change "Item.count", -1

    must_redirect_to items_path
  end
end

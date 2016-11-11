require "test_helper"

describe FaqsController do
  let(:faq) { faqs :one }

  it "gets index" do
    get faqs_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_faq_url
    value(response).must_be :success?
  end

  it "creates faq" do
    expect {
      post faqs_url, params: { faq: { answer: faq.answer, question: faq.question } }
    }.must_change "Faq.count"

    must_redirect_to faq_path(Faq.last)
  end

  it "shows faq" do
    get faq_url(faq)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_faq_url(faq)
    value(response).must_be :success?
  end

  it "updates faq" do
    patch faq_url(faq), params: { faq: { answer: faq.answer, question: faq.question } }
    must_redirect_to faq_path(faq)
  end

  it "destroys faq" do
    expect {
      delete faq_url(faq)
    }.must_change "Faq.count", -1

    must_redirect_to faqs_path
  end
end

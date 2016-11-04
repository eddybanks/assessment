class HomeController < ApplicationController
  def index
    @assessment_types = AssessmentType.all
  end

  def about
  end

  def calendar
  end

  def contact
  end

  def faqs
  end

  def wiki
  end

end

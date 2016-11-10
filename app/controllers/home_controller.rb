class HomeController < ApplicationController
  def index
    @assessment_types = AssessmentType.all
  end

  def about
    #page_variables
    @page_header = 'About The Site'
  end

  def calendar
  end

  def faqs
  end

  def wiki
  end

end

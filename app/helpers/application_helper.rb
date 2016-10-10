module ApplicationHelper
  def current_year
    Year.find_by name: '2016'
  end
end

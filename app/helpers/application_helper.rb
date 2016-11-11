module ApplicationHelper
  def current_year
    Year.find_by name: '2016'
  end

  def report_options
    return [:ar, :ap]
  end

  def snake word
    word.underscore.gsub(" ", "_")
  end
end

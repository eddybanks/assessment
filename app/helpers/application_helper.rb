module ApplicationHelper
  def current_year
    Year.find_by name: '2016'
  end

  def report_options
    return { ar: 'Assessment Reports', ap: 'Assessment Plans' }
  end

  def snake word
    word.underscore.gsub(" ", "_")
  end
end

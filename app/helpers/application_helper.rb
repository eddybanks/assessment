module ApplicationHelper
  def current_year
    Year.find_by name: '2016'
  end

  def assess_types report_type
    current_year.assessment_types.report_type(report_type)
  end

  def report_options
    return { ar: 'Assessment Reports', ap: 'Assessment Plans' }
  end

  def snake word
    word.underscore.gsub(" ", "_")
  end
end

ftree = { a: 'years', b: [:ar, :ap], c: 'assessment_types', d: 'templates', e: 'forms' }

admin = User.create(email: 'admin@admin.com', password: '123456')
input_types = JSON.parse(open('db/data/input_types.json').read)
input_types.each do |input|
  InputType.create(input)
end

def dirname model
  model.name.underscore.gsub(" ", "_")
end

years = JSON.parse(open('db/data/years.json').read)
years.each do |yr|
  year = Year.find_or_create_by(yr)
  ftree[:b].each do |b|
    a_file = nil
    a_file ||= JSON.parse(open("db/data/#{year.name}/#{b}/#{ftree[:c]}.json").read)
    if a_file.present?
      a_file.each do |atype|
        assessment_type = year.assessment_types.create(
          name: atype['name'],
          report_type: b
        )
        as_file = nil
        as_file ||= JSON.parse(open("db/data/#{year.name}/#{b}/#{dirname(assessment_type)}/#{ftree[:d]}.json").read)
        if as_file.present?
          as_file.each do |astype|
            template = assessment_type.templates.create(
              name: astype['name'],
              year_id: year.id
            )
          end
        end
      end
    end
  end
end

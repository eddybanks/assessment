ftree = { a: 'years', b: { ar: true, ap: false }, c: 'assessment_types', d: 'templates', e: 'forms' }

input_types = JSON.parse(open('db/data/input_types.json').read)
input_types.each do |input|
  InputType.create(input)
end

def dirname model
  model.name.underscore.gsub(" ", "_")
end

years = JSON.parse(open('db/data/years.json').read)
years.each do |yr|
  year = Year.create(yr)
  a_file, as_file, au_file = nil, nil, nil
  ftree[:b].each do |k, v|
    a_file ||= JSON.parse(open("db/data/#{year.name}/#{k}/#{ftree[:c]}.json").read)
    if a_file.present?
      a_file.each do |atype|
        assessment_type = year.assessment_types.create(
          name: atype['name'],
          rp_flag: v
        )
        as_file ||= JSON.parse(open("db/data/#{year.name}/#{k}/#{dirname assessment_type}/#{ftree[:d]}.json").read)
        if as_file.present?
          as_file.each do |astype|
            assessment_subtype = assessment_type.assessment_subtypes.create(
              name: astype['name'],
              rp_flag: v
            )
          end
        end
      end
    end
  end
end

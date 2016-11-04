ftree = { a: 'years', b: { ar: true, ap: false }, c: 'assessment_types', d: 'templates', e: 'forms' }

input_types = JSON.parse(open('db/data/input_types.json').read)
input_types.each do |input|
  InputType.create(input)
end

years = JSON.parse(open('db/data/years.json').read)
years.each do |yr|
  year = Year.create(yr)
  fname = nil
  ftree[:b].each do |k, v|
    fname ||= JSON.parse(open("db/data/#{year.name}/#{k}/#{ftree[:c]}.json").read)
    if fname.present?
      fname.each do |assessment_type|
        year.assessment_types.create(
          name: assessment_type['name'],
          rp_flag: v
        )
      end
    end
  end
end

ftree = { a: 'years', b: [:ar, :ap], c: 'assessment_types', d: 'templates', e: 'forms' }

def read_file json_file
  x = nil
  begin
    return JSON.parse(open(json_file).read)
  rescue
    return nil
  end
end

def dirname model
  model.name.underscore.gsub(" ", "_")
end

admin = User.create(email: 'admin@admin.com', password: '123456')
input_types = read_file('db/data/input_types.json')
input_types.each do |input|
  InputType.create(input)
end

faqs = read_file('db/data/faqs.json')
faqs.each do |faq|
  Faq.create(faq)
end

years = read_file('db/data/years.json')
years.each do |yr|
  year = Year.find_or_create_by(yr)
  ftree[:b].each do |b|
    a_file = nil
    a_file ||= read_file(open("db/data/#{year.name}/#{b}/#{ftree[:c]}.json"))
    if a_file.present?
      a_file.each do |atype|
        assessment_type = year.assessment_types.create(
          name: atype['name'],
          description: atype['description'].present? ? atype['description'] : nil,
          report_type: b
        )
        template_file = nil
        template_file ||= read_file("db/data/#{year.name}/#{b}/#{dirname(assessment_type)}/#{ftree[:d]}.json")
        if template_file.present?
          template_file.each do |astype|
            template = assessment_type.templates.create(
              name: astype['name'],
              year_id: year.id
            )
            form_file = nil
            form_file ||= read_file("db/data/#{year.name}/#{b}/#{dirname(assessment_type)}/#{astype['au_path']}/#{ftree[:e]}.json")
            if form_file.present?
              form_file.each do |autype|
                form = template.forms.create(
                  name: autype['name']
                )
                part_file = nil
                part_file ||= read_file("db/data/#{year.name}/#{b}/#{dirname(assessment_type)}/#{astype['au_path']}//#{astype['au_path']}.json")
                if part_file.present?
                  part_file.each do |p|
                    part = form.parts.create(
                      name: p['name']
                    )
                    if p['items'].present?
                      p['items'].each do |i|
                        item = part.items.create(
                          name: i['name'],
                          input_type_id: InputType.find_by(name: i['input_type']).id
                        )
                        item.section = Section.create( name: i['section'] )
                        data = ""
                        i['input_data'].each{ |d| data<<d } if i['input_data'].present?
                        item.input_datum = InputDatum.create( content: data ) if i['input_data'].present?
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

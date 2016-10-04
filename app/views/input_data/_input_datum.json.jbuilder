json.extract! input_datum, :id, :content, :created_at, :updated_at
json.url input_datum_url(input_datum, format: :json)
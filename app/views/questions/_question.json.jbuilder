json.extract! question, :id, :content, :qns_type, :created_at, :updated_at
json.url question_url(question, format: :json)

json.extract! event, :id, :user_id, :time, :place, :description, :created_at, :updated_at
json.url event_url(event, format: :json)

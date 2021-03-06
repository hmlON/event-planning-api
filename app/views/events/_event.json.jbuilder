json.extract! event, :id, :user_id, :time, :place, :description, :created_at, :updated_at
json.url event_url(event, format: :json)
json.attachments event.attachments do |attachment|
  attachment.url
end

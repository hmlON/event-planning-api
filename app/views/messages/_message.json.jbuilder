json.extract! message, :id, :text, :user_id, :event_id, :created_at, :updated_at
json.url event_message_url(event_id: message.event.id, id: message.id, format: :json)

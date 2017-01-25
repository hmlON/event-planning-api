json.extract! invite, :id, :sender_id, :event_id, :recipient_id, :email, :token, :created_at, :updated_at
json.url invite_url(invite, format: :json)
json.extract! event, :id, :event_name, :start_date, :end_date, :address, :latitude, :longitude, :organizer, :detail, :created_at, :updated_at
json.url event_url(event, format: :json)

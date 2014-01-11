json.array!(@events) do |event|
  json.extract! event, :id, :type, :created_at, :charge_id
  json.url event_url(event, format: :json)
end

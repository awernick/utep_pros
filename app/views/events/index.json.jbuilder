json.array!(@events) do |event|
  json.extract! event, :id, :title, :date, :open
  json.url event_url(event, format: :json)
end

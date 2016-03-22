json.array!(@rooms) do |room|
  json.extract! room, :id, :room_no, :rate, :discount, :available, :description, :total_beds, :total_people, :meal
  json.url room_url(room, format: :json)
end

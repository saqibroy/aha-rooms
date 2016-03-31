json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :no_of_rooms, :total_price, :check_in_date, :check_out_date, :room_id, :user_id
  json.url reservation_url(reservation, format: :json)
end

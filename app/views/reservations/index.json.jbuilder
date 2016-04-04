json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :no_of_rooms, :total_price, :room_id, :user_id
  json.start reservation.check_in_date
  json.start reservation.check_out_date
  json.url reservation_url(reservation, format: :json)
end

json.extract! room_reservation, :id, :start_date, :end_date, :room_id, :created_at, :updated_at
json.url room_reservation_url(room_reservation, format: :json)

json.extract! accommodation, :id, :name, :description, :address, :average_grade, :latitude, :longitude, :image_url, :approved, :place_id, :created_at, :updated_at
json.url accommodation_url(accommodation, format: :json)

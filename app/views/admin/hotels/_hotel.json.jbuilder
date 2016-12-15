json.extract! hotel, :id, :name, :countRoom, :introduction, :hotel_kind, :phone_number, :website, :score_average, :created_at, :updated_at
json.url hotel_url(hotel, format: :json)
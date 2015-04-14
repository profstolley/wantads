json.array!(@ads) do |ad|
  json.extract! ad, :id, :title, :description, :user_id
  json.url ad_url(ad, format: :json)
end

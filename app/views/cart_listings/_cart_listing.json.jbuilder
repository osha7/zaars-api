json.extract! cart_listing, :id, :created_at, :updated_at
json.url cart_listing_url(cart_listing, format: :json)

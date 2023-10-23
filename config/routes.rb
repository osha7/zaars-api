Rails.application.routes.draw do

  root to: "static#home"

  devise_for :users
  resources :users
  
  resources :images
  put "/image_upload" => "images#image_upload"

  resources :tailoring_sizes
  resources :listing_shipping_statuses
  resources :cart_listings
  resources :listing_tags
  resources :tags
  resources :listing_styles
  resources :styles
  resources :offers
  resources :follows
  resources :reviews
  resources :listings
  resources :orders
  resources :types
  resources :stores

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post "/create_express_account" => "users#create_express_account"
  post "/create_account_link" => "users#create_account_link"
  get "/retrieve_express_account" => "users#retrieve_express_account"

  namespace :api do
    namespace :v1 do
    end
  end

end

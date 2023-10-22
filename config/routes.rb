Rails.application.routes.draw do
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
end

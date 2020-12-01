Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :store
      resources :product
      resources :store_product
      resources :order
    end
  end
end

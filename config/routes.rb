Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :store
      resources :product
    end
  end
end

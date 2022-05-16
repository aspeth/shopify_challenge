Rails.application.routes.draw do
  resources :stores, only: [:index] do
    resources :items
    resources :shipments
  end
end

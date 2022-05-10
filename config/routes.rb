Rails.application.routes.draw do
  resources :stores, only: [:index] do
    resources :items
  end
end

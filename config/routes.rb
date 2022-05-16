Rails.application.routes.draw do

  get '/', to: 'welcome#index'

  resources :stores, only: [:index] do
    resources :items
    resources :shipments
  end
end

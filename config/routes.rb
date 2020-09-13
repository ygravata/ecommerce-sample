Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products do
    resources :cart_products, only: [:new, :create]
    collection do
      post 'upload'
      get 'list'
    end
    member do
      patch 'add_to_cart'
    end
  end
  resources :carts, only: [:index, :update, :show] do
    resources :cart_products, only: [:udpate, :destroy]
    member do
      get 'checkout'
      patch 'checkout'
    end
  end
end

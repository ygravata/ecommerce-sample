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
  resources :carts, only: [:index, :update, :destroy] do
    resources :cart_products, only: [:udpate]
    member do
      get 'checkout'
      patch 'checkout'
    end
    resources :coupons
  end
  resources :cart_products, only: [:update, :destroy] do
    member do
      patch 'add_unit'
      patch 'reduce_unit'
    end
  end
end

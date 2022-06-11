Rails.application.routes.draw do
  
  root to: 'homes#top'
  get 'about' => "homes#about"
  
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "publics/registrations",
    sessions: "publics/sessions"
  }

  namespace :publics do
    resources :products, only: [:index, :show]
    resources :cart_products, only: [:create, :index]
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
  end

  devise_for :admins, skip: [:registrations, :password], controllers: {
    sessions: "admins/sessions"
  }

  namespace :admins do
    resources :products, only: [:new, :create, :index, :show, :edit, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

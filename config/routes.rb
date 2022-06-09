Rails.application.routes.draw do
  
  root to: 'homes#top'
  get 'about' => "homes#about"
  
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "publics/registrations",
    sessions: "publics/sessions"
  }
  devise_for :admins, skip: [:registrations, :password], controllers: {
    sessions: "admins/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users,  controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#index'
  get '/news_by_date' => "home#news_by_date"

  resources :news, only: [:show]
  resources :categories, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :payments
 

  devise_for :users,  controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#index'
  get '/news_by_month' => "home#news_by_month"

  resources :news, only: [:show, :index]
  resources :videos, only:[:show, :index] 
  resources :e_books, only:[:show, :index] 
  resources :categories, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

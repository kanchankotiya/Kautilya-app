Rails.application.routes.draw do
  devise_for :users,  controllers: {
    sessions: 'users/sessions'
  }

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#index'
  

  resources :news, only: [:show]
  resources :categories
  resources :categories do 
    resources :news,only: [:show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

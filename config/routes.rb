Rails.application.routes.draw do

  # devise
  devise_for :users, controllers: {
    registrations: 'registrations'
  }

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  resources :posts, param: :slug do
    resource :replies, only: %i[ new create ]
  end

  resources :tags, param: :slug, only: %i[ show new create ]

  namespace :admin do
    resources :posts
  end

  get 'signout_confirm', to: 'users#signout_confirm'

  root 'home#index'
end

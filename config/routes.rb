Rails.application.routes.draw do

  # devise
  devise_for :users, controllers: {
    registrations: 'registrations'
  }

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  # Admin Panel
  namespace :admin do
    get '/', to: redirect('/admin/posts')

    resources :posts, only: %i[index]
    resources :comments, only: %i[index]
  end

  resources :posts, param: :slug, except: %i[index] do
    get 'delete_confirm', on: :member

    resource :replies, only: %i[create]
  end

  resources :users, only: %i[destroy update]

  resources :tags, param: :slug, only: %i[show new create]

  get 'settings/(:tab)', to: 'users#edit', as: 'user_settings'
  post 'request_destroy', to: 'users#request_destroy'
  # delete 'users/destroy/:username', to: 'users#destroy', as: 'user_destroy'
  # patch 'users/:username', to: 'users#update'
  get 'confirm_destroy/:token', to: 'users#confirm_destroy', as: 'confirm_destroy'
  get 'confirm_signout', to: 'users#confirm_signout'

  # 404 page
  match '*unmatched', to: 'errors#page_not_found', via: :all

  root 'home#index'
end

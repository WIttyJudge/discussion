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
    resource :replies, only: %i[create]
  end

  resources :tags, param: :slug, only: %i[show new create]

  get 'signout_confirm', to: 'users#signout_confirm'

  # 404 page
  match '*unmatched', to: 'errors#page_not_found', via: :all

  root 'home#index'
end

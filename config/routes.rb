Rails.application.routes.draw do
  devise_for :admins, controllers:{
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  root to: 'tops#top', as: "top"

  resources :users, only:[:index, :show, :edit, :update]
  resources :retires, only:[:new, :create]
  resources :sake_posts, only:[:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :sake_comments, only:[:create, :destroy]
    resource :favorites, only:[:create, :destroy]
  end
  get 'tags/:tag', to: 'sake_posts#index', as: :tag
  root to: 'sake_posts#index'
  namespace :admins do
    resources :users, only:[:index, :edit, :update]
  end
  get '/admins_top' => 'admins#index', as:'admins'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

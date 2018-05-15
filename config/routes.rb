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
  resources :users, only:[:show, :edit, :update]
  resources :retires, only:[:new, :create]
  resources :sake_posts, only:[:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :sake_comments, only:[:create, :destroy]
    resource :favorites, only:[:create, :destroy]
    resource :tags, only:[:create, :destroy]
  end

  namespace :admins do
    resources :users, only:[:index, :edit, :update]
    resources :tags, only:[:index, :create, :destroy]
  end
  root to: 'tops#top'
  get '/admins_top' => 'admins#index', as:'admins'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

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
  get "/users/:id/user_posts" => "users#user_post", as:"user_post"
  resources :users, only:[:index, :show, :edit, :update]
  resources :retires, only:[:new, :create]
  resources :sake_posts, only:[:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :sake_comments, only:[:create, :destroy]
    resource :favorites, only:[:create, :destroy]
  end
  get 'tags/:tag_list', to: 'sake_posts#index', as: :tag
  root to: 'sake_posts#index'
  namespace :admins do
    resources :users, only:[:index, :show, :edit, :update, :destroy]
    resources :sake_posts, only:[:index, :new, :edit, :update, :destroy]
    resources :tags, only:[:edit, :update]
  end
  get '/admins/top' => 'admins#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

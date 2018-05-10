Rails.application.routes.draw do
  namespace :admins do
    get 'tags/index'
  end

  namespace :admins do
    get 'users/index'
  end

  namespace :admins do
    get 'users/edit'
  end

  get 'admins/index'

  get 'retires/new'

  get 'users/index'

  get 'users/show'

  get 'users/edit'

  get 'sakes/index'

  get 'sakes/new'

  get 'sakes/show'

  get 'sakes/edit'

  get 'tops/top'

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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

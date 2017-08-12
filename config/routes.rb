Rails.application.routes.draw do
  # namespace :admin do
  #   get 'password_resets/new'
  # end

  namespace :admin do
    #get 'sessions/new'
    get "login" => "sessions#new", :as => "login"
  end

  namespace :admin do
    get "logout" => "sessions#destroy", :as => "logout"
  end

  namespace :admin do
    get 'sessions/create'
  end

  namespace :admin do
    get 'users/new'
  end

  namespace :admin do
    get 'users/create'
  end

  namespace :admin do
    get 'users/edit'
  end

  namespace :admin do
    get 'users/update'
  end

  namespace :admin do
    get 'users/destroy'
  end

  namespace :admin do
    get 'users/index'
  end

  namespace :admin do
    get 'users/show'
  end

  namespace :admin do
    get 'contacts/new'
  end

  namespace :admin do
    get 'contacts/create'
  end

  namespace :admin do
    get 'contacts/edit'
  end

  namespace :admin do
    get 'contacts/update'
  end

  namespace :admin do
    get 'contacts/destroy'
  end

  namespace :admin do
    get 'contacts/index'
  end

  namespace :admin do
    get 'contacts/show'
  end

  get 'contact' => 'contacts#new'

  get 'contacts/create'

  get 'about' => 'about#index' 

  namespace :admin do
    get 'parts/new'
  end

  namespace :admin do
    get 'parts/create'
  end

  namespace :admin do
    get 'parts/edit'
  end

  namespace :admin do
    get 'parts/update'
  end

  namespace :admin do
    get 'parts/destroy'
  end

  namespace :admin do
    get 'parts/index'
  end

  namespace :admin do
    get 'parts/show'
  end

  namespace :admin do
    get 'parts/archive'
  end

  get 'parts/new'

  get 'parts/create'


  get 'parts/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :parts
  resources "contacts", only: [:new, :create]

  namespace :admin do
    resources :parts, :users, :contacts, :sessions
    # resources :password_resets
    #resources "sessions" only: [:new, :create]
    root to: 'parts#index'
    root to: 'contacts#index'
  end
  root 'parts#index'
end

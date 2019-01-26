Rails.application.routes.draw do
  root 'root#index'
  get '/users', to: 'users#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  resources :users, only: [:index, :show]

  namespace :pages do
    get '', :to => 'home#index'
    get 'features', :to => 'features#index'
    get 'price', :to => 'price#index'
    get 'elements', :to => 'elements#index'
    get 'blog', :to => 'blog#index'
    get 'contact', :to => 'contact#index'
  end
end



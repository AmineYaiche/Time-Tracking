Rails.application.routes.draw do
  get '/users', to: 'users#index'
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



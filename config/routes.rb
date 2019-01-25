Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  namespace :pages do
    get 'home', :to => 'home#index'
    get 'features', :to => 'features#index'
    get 'price', :to => 'price#index'
    get 'elements', :to => 'elements#index'
    get 'blog', :to => 'blog#index'
    get 'contact', :to => 'contact#index'
  end
end



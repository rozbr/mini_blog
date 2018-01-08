Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/categories/new' => 'categories#new', as: :categories
  post '/categories/new' => 'categories#create'

  root 'posts#index'
end

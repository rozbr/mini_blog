Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/categories/new' => 'categories#new', as: :categories
  post '/categories/new' => 'categories#create'

  get '/posts/new' => 'posts#new', as: :posts
  get '/posts/:id' => 'posts#show', as: :show_post
  get '/posts/:id/export_csv' => 'posts#export_csv', as: :export_as_csv
  post '/posts/new' => 'posts#create'
  match '/posts' => 'posts#list', as: :list_posts, via: [:get, :post]

  root 'posts#index'
end

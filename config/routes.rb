Rails.application.routes.draw do

  resources :testimonials
  mount Ckeditor::Engine => '/ckeditor'
  resources :permissions
  resources :sessions
  resources :users
  resources :posts
  get '/about' => 'pages#about'

  get '/contact' => 'pages#contact'

  root 'pages#index'

  get '/blog' => 'posts#index'

  get '/register' => 'users#new'

  get '/profile/:id' => 'users#show'

  get '/login' => 'sessions#new'

  resources :categories
  
end

Rails.application.routes.draw do

  
  namespace :madmin do
    resources :posts
  end
  resources :testimonials
  
  mount Ckeditor::Engine => '/ckeditor'

  resources :permissions

  resources :sessions

  resources :users

  resources :posts do 
    resources :comments
  end

  get '/about' => 'pages#about'

  get '/contact' => 'pages#contact'

  root 'pages#index'

  get '/blog' => 'posts#index'

  get '/register' => 'users#new'

  get '/profile/:id' => 'users#show'

  get '/login' => 'sessions#new'

  get 'tags/:tag', to: 'posts#tag', as: :tag

  resources :categories

  # admin
  namespace :madmin do
    resources :posts
    resources :dashboard
    get '', to: 'dashboard#index', as: '/'
  end
end

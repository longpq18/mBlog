Rails.application.routes.draw do

  
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
  
end

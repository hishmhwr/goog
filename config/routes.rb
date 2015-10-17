Rails.application.routes.draw do
  root 'pages#home'
  get '/trending' => 'pages#trending'
  get '/upload' => 'pages#upload'
  get 'signup'  => 'users#new' 
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  get 'auth/:provider/callback' => "sessions#createo"
  delete 'sign_out' => "sessions#destroyo", as: 'sign_out'
  resources :users
end

Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  get 'pages/secret'
  resources :posts
  resources :users
  root to:'posts#index'

  get '/login'     => 'sessions#new'
  post '/login'    => 'sessions#create'
  get '/logout' => 'sessions#destroy'  

  post '/posts/confirm' => 'posts#confirm'
  post '/posts/updateConfirm' => 'posts#updateConfirm'
  post '/posts/update' => 'posts#update'
  delete '/posts/destroy' => 'posts#destroy'
  get '/search' => 'posts#search'

  get '/users' =>'users#index'
  post '/users/confirm' => 'users#confirm'
end

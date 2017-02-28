Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/locations' => 'locations#index', as: 'locations'
  post '/locations' => 'locations#create'
  post '/locations/:id' => 'locations#add_user', as: 'add_user'
  get '/locations/:id'  => 'locations#show', as: 'location'
  delete '/locations/:id' => 'locations#destroy'



  get '/users' => 'users#index', as: 'users'
  get '/users/new' => 'users#new', as: 'new_user'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show', as: 'user'
  get '/users/:id/edit' => 'users#edit', as: 'edit_user'
  patch '/users/:id' => 'users#update'

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


end

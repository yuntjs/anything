Rails.application.routes.draw do
  devise_for :users, { sessions: 'users/sessions' }
  root 'homepage#index'
  get '/find' => 'restaurants#index'
  post '/find' => 'restaurants#find'
  get '/session' => 'homepage#session'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

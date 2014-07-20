Rails.application.routes.draw do
  root 'home#index'


  resource :session, only: :new
  get '/logout', to: 'sessions#destroy', as: :logout
  get '/unfollow/:uid', to: 'friendships#destroy', as: :unfollow

  get '/auth/:provider/callback', to: 'sessions#create'
end

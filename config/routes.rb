Rails.application.routes.draw do
  root 'home#index'

  resource :session, only: :new
  get '/auth/:provider/callback', to: 'sessions#create'
end

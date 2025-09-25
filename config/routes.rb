Rails.application.routes.draw do
  resources :movies
  root 'movies#index' # route '/' pra index do controller movies
end

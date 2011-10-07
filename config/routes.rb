Gasolineapp::Application.routes.draw do
  resources :performances, :only=>[:index, :create]
  root :to => "home#index"
  devise_for :users, controllers: {registrations: "users/registrations"}
  resource :profile , only: [:show,:edit,:update], controller: "users/profiles"
  resource :car , only: [:show,:edit,:update]
  resource :performance, only: [:new]
end

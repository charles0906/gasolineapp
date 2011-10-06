Gasolineapp::Application.routes.draw do

  root :to => "home#index"
  devise_for :users, controllers: {registrations: "users/registrations"}
  resource :profile , only: [:show,:edit,:update], controller: "users/profiles"
  resource :car , only: [:show,:edit,:update]
 
end

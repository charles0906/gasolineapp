Gasolineapp::Application.routes.draw do
  resources :performances, :only=>[:create]
  root :to => "home#index"
  devise_for :users, controllers: {registrations: "users/registrations"}
  resource :profile , only: [:show,:edit,:update], controller: "users/profiles"
  resource :car , only: [:show,:edit,:update]
  resource :performance, only: [:new]
  match 'station/:station' => 'performances#index', :as => 'station'
  match 'user/:user' => 'performances#index', :as => 'user'
  match 'car_info/:car' => 'performances#index', :as => 'car_info'
end

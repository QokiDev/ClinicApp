Rails.application.routes.draw do
  devise_for :users
  resources :patient_cards
  resources :patients
  resources :doctors
  resources :specializations
  resources :departments
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "root#index"
end

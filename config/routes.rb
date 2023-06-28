Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "places#index"
  resources :places
  resources :properties
  resources :property_form_steps
  resources :profiles, only: [ :edit, :update]
  scope "/users" do
    get "account_settings", to: "profiles#account_setting"
  end
end

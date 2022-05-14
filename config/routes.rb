Rails.application.routes.draw do
  devise_for :users
  resources :events
  post '/participations/register', to: "participations#register", as: "register"
  post '/participations/unregister', to: "participations#unregister", as: "unregister"
  get 'users/:id' => 'users#show', as: :user
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"
end

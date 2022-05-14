Rails.application.routes.draw do
  devise_for :users
  resources :events
  post '/participations/register', to: "participations#register", as: "register"
  post '/participations/unregister', to: "participations#unregister", as: "unregister"
  post '/favorites/add_to_favorites', to: "favorites#add_to_favories", as: "add_to_favorites"
  post '/favorites/remove_from_favorites', to: "favorites#remove_from_favorites", as: "remove_from_favorites"
  post '/invitations/generate_invite_list', to: "invitations#generate_invite_list", as: "generate_invite_list"
  get 'users/:id' => 'users#show', as: :user
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"
end

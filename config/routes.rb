Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "artists/subscribe" , to: "artists#subscribe" # needs consistency
  get "artists/explore" , to: "artists#explore", as: "artist_explore" # needs consistency
  get "artists/:id/profile", to: "artists#profile" , as: "artist_profile"
  get "artists/:id/support", to: "artists#support" , as: "artist_support"
  get "artists/:id/projects", to: "artists#projects" , as: "artist_fan_projects"

  resources :artists do 
    resources :artist_profiles
    resources :posts
    resources :projects
  end

  get "fans/:fan_id/subscriptions" , to: "fans#subscriptions", as: "fan_subscriptions"
  get "fans/:fan_id/my_collection" , to: "fans#my_collection", as: "fan_my_collection"
  resources :fans do 
    resources :fan_accounts
    resources :fan_profiles
    resources :artists
  end


  root "artists#index"

end

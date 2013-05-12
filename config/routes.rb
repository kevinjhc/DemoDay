Demoday::Application.routes.draw do
  
  root :to => 'static_pages#index'

  match '/map', to: 'static_pages#map'

  resources :startups
  match '/follow', to: 'startups#follow'
  match '/send_email', to: 'startups#send_email'

  # Angellist Oauth
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

end
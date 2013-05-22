Demoday::Application.routes.draw do


  root :to => 'static_pages#index'
  match '/map', to: 'static_pages#map'

  resources :startups

  resources :angellist_follows, only: [:create] # POST /follows
  resources :email_contacts, only: [:create] # POST /emails

  # $.post('/follows', {}, function() {
  #   $('#form_id').text('s');
  # })

  # Pings
  # match '/follow', to: 'pings#follow'
  # match '/send_email', to: 'pings#send_email'

  # Angellist Oauth
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: 'sessions#failure'
  match 'signout', to: 'sessions#destroy', as: 'signout'

  # Omniauth Identities registration
  resources :identities

  # Become an Admin
  match '/admin', to: 'admin#index'
  match '/become_admin', to: 'admin#become_admin'
  
end
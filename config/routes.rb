Demoday::Application.routes.draw do
  
  match '/map', to: 'static_page#map'

  resources :startups
  match '/follow', to: 'startups#follow'

  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

  root :to => 'static_pages#index'

end

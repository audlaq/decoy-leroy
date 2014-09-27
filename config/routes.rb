HackathonStarterRails::Application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => "users/registrations",
    :omniauth_callbacks => "users/omniauth_callbacks"
  }
  
  root 'home#index'
  resources :decoys
end

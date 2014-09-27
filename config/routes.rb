HackathonStarterRails::Application.routes.draw do
  devise_for :users, controllers: {
      registrations: "users/registrations",
      omniauth_callbacks: "users/omniauth_callbacks"
  }, skip: [:sessions]

  devise_scope :user do
    get 'users/sign_in' => 'users/omniauth_callbacks#redirect', :as => :new_user_session
    post 'users/sign_in' => 'users/omniauth_callbacks#redirect', :as => :user_session
    delete 'users/signout' => 'devise/sessions#destroy', :as => :destroy_user_session
  end


  root 'home#index'
  resources :decoys
  resources :issues
  resources :admin
end

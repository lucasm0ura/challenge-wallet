Rails.application.routes.draw do
  devise_for :users
  
  namespace :api, defaults: { format: :json } do
    mount_devise_token_auth_for 'User', at: 'auth'

    namespace :v1 do
      resources :users
    end
  end
end

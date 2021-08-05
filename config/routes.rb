Rails.application.routes.draw do
  devise_for :users
  
  namespace :api, defaults: { format: :json } do
    mount_devise_token_auth_for 'User', at: 'auth'

    namespace :v1 do
      resources :users do
        post 'wallet/:wallet_id/add', to: 'wallets#add'
        post 'wallet/:wallet_id/remove', to: 'wallets#remove'
      end      
    end
  end
end

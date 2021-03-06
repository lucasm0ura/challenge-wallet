Rails.application.routes.draw do
  devise_for :users
  
  namespace :api, defaults: { format: :json } do
    mount_devise_token_auth_for 'User', at: 'auth'

    namespace :v1 do
      resources :users do
        post 'wallet/:wallet_id/add', to: 'wallets#add'
        post 'wallet/:wallet_id/remove', to: 'wallets#remove'
        get 'wallet/:wallet_id/index', to: 'wallets#index'
        post 'wallet/:wallet_id/period', to: 'wallets#wallet_history_period'
      end      
    end
  end
end

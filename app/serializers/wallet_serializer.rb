class WalletSerializer < ActiveModel::Serializer
  attributes :user_id, :current_balance, :created_at, :wallet_histories
end

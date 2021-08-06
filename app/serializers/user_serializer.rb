class UserSerializer < ActiveModel::Serializer
  attributes :name, :email, :wallet


  def wallet
    { current_balance: self.object.wallet.current_balance }
  end
end

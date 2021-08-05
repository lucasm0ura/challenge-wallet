class UserSerializer < ActiveModel::Serializer
  attributes :name, :email, :created_at, :wallet


  def wallet
    {current_balance: self.object.wallet.current_balance,
      created_at: self.object.wallet.created_at
    }
  end
end

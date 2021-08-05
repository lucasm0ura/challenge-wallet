class AddReferenceWalletToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :wallet, foreign_key: true
  end
end

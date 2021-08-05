class CreateWalletHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :wallet_histories do |t|
      t.decimal :value
      t.string :operation
      t.references :wallet, foreign_key: true

      t.timestamps
    end
  end
end

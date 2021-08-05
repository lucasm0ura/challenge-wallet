class WalletHistory < ApplicationRecord
    has_and_belongs_to_many :wallets, :join_table => :wallets_wallets_histories
end

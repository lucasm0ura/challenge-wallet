class Wallet < ApplicationRecord
    has_and_belongs_to_many :users, :join_table => :wallets_users
    belongs_to :wallet_history

    CREDIT = 'CREDIT'
    DEBIT = 'DEBIT'
    
    def self.create_wallet(user)
        user.wallet.create(current_balance: 0.0)
        user.save
    end

    def self.add(wallet_id, value)
        wallet = Wallet.find_by_id(wallet_id)
        WalletHistory.create(operation: CREDIT, value: value, wallet_id: wallet.id)
        wallet.current_balance += value
        wallet.save
    end

    def self.remove(wallet_id, value)
        wallet = Wallet.find_by_id(wallet_id)
        WalletHistory.create(operation: DEBIT, value: value, wallet_id: wallet.id)
        wallet.current_balance -= value
        if !wallet.current_balance.zero?
            wallet.save
        else
            false
        end
    end
end

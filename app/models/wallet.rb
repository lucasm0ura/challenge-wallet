class Wallet < ApplicationRecord
    has_and_belongs_to_many :users, :join_table => :wallets_users
    has_many :wallet_histories

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

    def self.period(initial_date, end_date)
        initial_date = initial_date.to_date.at_beginning_of_day
        end_date = end_date.to_date.at_end_of_day
        WalletHistory.where(created_at: initial_date..end_date)
    end
end

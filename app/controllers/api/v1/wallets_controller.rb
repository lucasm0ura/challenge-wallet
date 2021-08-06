module Api
    module V1
        class WalletsController < Api::V1::ApplicationController
            before_action :authenticate_api_user!
            before_action :set_wallet, only: %i[ index ]

            def index
                render json: @wallet, status: :ok                
            end

            def wallet_history_period
                wallet_histories = Wallet.period(params[:initial_date], params[:end_date])
                render json: wallet_histories, status: :ok    
            end

            def add
                if Wallet.add(params[:wallet_id], params[:value])
                    render json: {:message => 'Amount added successfully.', :status=> :saved}
                else
                    render json: {:message => 'Something wrong, check data and try again.', :status=> :unprocessable_entity}
                end
            end

            def remove
                if Wallet.remove(params[:wallet_id], params[:value])
                    render json: {:message => 'Amount removed successfully.', :status=> :saved}
                else
                    render json: {:message => 'Insuficient current balance.', :status=> :unprocessable_entity}
                end        
            end

            private
            def set_wallet
                @wallet = Wallet.find(params[:wallet_id])
            end
        end
    end
end
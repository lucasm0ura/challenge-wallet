module Api
    module V1
        class WalletsController < Api::V1::ApplicationController

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
        end
    end
end
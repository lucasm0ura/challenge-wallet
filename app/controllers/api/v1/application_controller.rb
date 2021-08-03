module Api
    module V1
      class ApplicationController < ApplicationController   
        include DeviseTokenAuth::Concerns::SetUserByToken

        rescue_from CanCan::AccessDenied do |exception|
          redirect_to root_url, :alert => exception.message
        end
    
        def accessible_roles
            @accessible_roles = Role.accessible_by(current_ability,:read)
        end
    
        def get_user
            @current_user = current_user
        end        
      end
    end
end
module Api
    module V1
      class UsersController < Api::V1::ApplicationController
        before_action :authenticate_api_user!
        before_action :set_user, only: %i[ show update destroy ]
  
        # GET /users
        # GET /users.json
        def index
          @users = User.all
          render json: @users
        end
  
        # GET /users/1
        # GET /users/1.json
        def show
            render json: @user
        end
  
        # POST /users
        # POST /users.json
        def create
          @user = User.new(user_params)
          @user.uid = user_params[:email]
          if @user.save
            render json: @user, status: :created
          else
            render json: @user.errors, status: :unprocessable_entity
          end
        end
  
        # PATCH/PUT /users/1
        # PATCH/PUT /users/1.json
        def update
          if @user.update(user_params)
            render json: @user, status: :ok
          else
            render json: @user.errors, status: :unprocessable_entity
          end
        end
  
        # DELETE /users/1
        # DELETE /users/1.json
        def destroy
          if @user.destroy
            render json: @user, status: :ok
          else
            render json: @user.errors, status: :unprocessable_entity
          end
  
        end
  
        private
          def set_user
            @user = User.find(params[:id])
          end
  
          def user_params
            params_list = [:name, :email, :role_id]
            params_list = params_list + [:password, :password_confirmation] unless params[:user][:password].blank?
            params.require(:user).permit(params_list)
          end
      end
    end
  end
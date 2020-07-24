class UsersController < ApplicationController
    include UserHelper
    
    layout "users"

    def show
        @user = User.find_by(id: session[:user_id])
    end

    def edit
        @user = User.find_by(id: session[:user_id])
    end

    def update
        @user = User.find_by(id: session[:user_id])
        @user.update(user_params)
        redirect_to edit_user_path(@user)
    end

    def lists
        @user = User.find_by(id: params[:id])
        @commitments = current_user.commitments
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :country, :avatar)
    end

end
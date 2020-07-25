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

    def complete_list
        
        if current_user.lists.last && Date.today.strftime("%Y-%m-%d") == current_user.lists.last.title
            redirect_to "/users/#{current_user.id}/lists", notice: "You have already completed a to-do list for today!"
        else
            
            @list = List.create(title: "#{Date.today}", completed_challenges: params[:list], user: current_user)
            @user = User.find_by(id: params[:id])
            @user.lists << @list
            @commitments = current_user.commitments
            
            render :lists
        end
    end

    def clear_lists
        @user = User.find_by(id: params[:id])
        @user.lists.delete_all

        redirect_to "/users/#{@user.id}/lists"
    end

    def undo_lists
        @user = User.find_by(id: params[:id])
        @user.lists.last.delete

        redirect_to "/users/#{@user.id}/lists"
    end

    def report
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :country, :avatar, :goal)
    end

end
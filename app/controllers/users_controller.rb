class UsersController < ApplicationController
    include UserHelper
    layout "users"

    # renders user home page with newsfeed
    def show
        @user = User.find_by(id: session[:user_id])
    end

    # renders form for editing user data
    def edit
        @user = User.find_by(id: session[:user_id])
    end

    # updates user data and redirects to edit form
    def update
        @user = User.find_by(id: session[:user_id])
        @user.update(user_params)
        redirect_to edit_user_path(@user)
    end

    # deletes current user's profile
    def destroy
        if logged_in? && current_user.id == params[:id].to_i
            current_user.destroy
            session.clear
            redirect_to "/"
        end
    end

    # renders pending and previous to-do lists based on current user's commitments
    def lists
        @user = current_user
        @commitments = @user.commitments
    end

    # creates list with completed challenges, validates if list was already submitted and gives user points for completed challenges
    def complete_list
        if current_user.lists.last && Date.today.strftime("%Y-%m-%d") == current_user.lists.last.title
            redirect_to "/users/#{current_user.id}/lists", notice: "You have already completed a to-do list for today!"
        else
            @list = List.create(title: "#{Date.today}", completed_challenges: params[:list], user: current_user)
            @user = User.find_by(id: params[:id])
            @user.lists << @list
            @user.points += @list.completed_challenges.size
            @user.save
            @commitments = current_user.commitments
            
            render :lists
        end
    end

    # clears list display without deleting points for completed challenges
    def clear_lists
        @user = User.find_by(id: params[:id])
        @user.lists.delete_all
        
        redirect_to "/users/#{@user.id}/lists"
    end

    # deletes last list and subtracts previously added points
    def undo_lists
        @user = User.find_by(id: params[:id])
        @user.points -= @user.lists.last.completed_challenges.size
        @user.lists.last.delete
        @user.save
        
        redirect_to "/users/#{@user.id}/lists"
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :country, :avatar, :goal)
    end
end
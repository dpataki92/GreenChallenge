class UsersController < ApplicationController
    include UserHelper
    layout "users"

    # rendering user home page with newsfeed
    def show
        @user = User.find_by(id: session[:user_id])
    end

    # rendering form for editing user data
    def edit
        @user = User.find_by(id: session[:user_id])
    end

    # updating user data and redirecting to edit form
    def update
        @user = User.find_by(id: session[:user_id])
        @user.update(user_params)
        redirect_to edit_user_path(@user)
    end

    # rendering pending and previous to-do lists based on user's commitments
    def lists
        @user = current_user
        @commitments = @user.commitments
    end

    # creating list with completed challenges, validating if list for today was already submitted and adds points to user's points
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

    # clearing list display without deleting points for completed challenges
    def clear_lists
        @user = User.find_by(id: params[:id])
        @user.lists.delete_all
        
        redirect_to "/users/#{@user.id}/lists"
    end

    # deleting last list and subtracting previously added points
    def undo_lists
        @user = User.find_by(id: params[:id])
        @user.points -= @user.lists.last.completed_challenges.size
        @user.lists.last.delete
        @user.save
        
        redirect_to "/users/#{@user.id}/lists"
    end

    # rendering page with total user data
    def report
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :country, :avatar, :goal)
    end

end
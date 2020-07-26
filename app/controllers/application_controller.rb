class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

   
    #helpers

    def logged_in?
        !!session[:user_id]
    end
   
    def sort_challenges
        if params[:value] == "creation"
            @challenges = Challenge.order(created_at: :desc)
        elsif params[:value] == "users"
            @challenges = Challenge.all.sort {|a, b| b.users.size <=> a.users.size}
        elsif params[:value] == "alphabet"
            @challenges = Challenge.all.sort {|a, b| a.title <=> b.title}
        elsif params[:value] == "me"
            @challenges = Challenge.where(:creator => current_user.name)
        end
    end
end

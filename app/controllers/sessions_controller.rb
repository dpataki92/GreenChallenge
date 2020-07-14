class SessionsController < ApplicationController

    def home
    end

    def create
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
        end

        session[:user_id] = @user.id
     
        render "/users/#{@user.id}"
    end

    def signup_page
    end

    def signup_manual
        @user = User.new(user_params)
        
        if @user.save
            session[:user_id] = @user.id

            render "/users/#{@user.id}"
        else
            flash[:alert] = "Invalid user data"
            render "/signup"
        end
    end

    def login_manual
        user = User.find_by(name: params[:user][:name])
        return head(:forbidden) unless user.authenticate(params[:user][:password])
        session[:user_id] = user.id

        redirect_to "/signup"
    end
     
    private
     
    def auth
        request.env['omniauth.auth']
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :country)
    end
end
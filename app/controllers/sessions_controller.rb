class SessionsController < ApplicationController

    # rendering view for third-party and manual login / signup
    def home
    end

    # finds / creates and logs in user based on third-party authentication
    def create
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.password = SecureRandom.urlsafe_base64(n=6)
        end

        session[:user_id] = @user.id
      
        redirect_to user_path(@user)
    end

    # handles manual login and authentication
    def manual_login
        
        @user = User.find_by(name: params[:user][:name])
     
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id

            redirect_to "/users/#{@user.id}"
        else
            redirect_to "/",  notice: "Sorry, invalid data!"
        end
    end

    # renders form for manual signup
    def signup_page
    end

    # handles manual signup and aithentication
    def manual_signup
        @user = User.new(user_params)
        
        if @user.save
            session[:user_id] = @user.id

            redirect_to "/users/#{@user.id}"
        else
            redirect_to "/signup", notice: "Invalid user data!"
        end
    end

     
    private
     
    def auth
        request.env['omniauth.auth']
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :country)
    end
end
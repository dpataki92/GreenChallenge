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
    end

    def login_manual
    end
     
    private
     
    def auth
        request.env['omniauth.auth']
    end
end
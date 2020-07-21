class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    helpers do

        def logged_in?
            !!session[:user_id]
        end
    end
  
end

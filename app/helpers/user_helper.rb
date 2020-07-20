module UserHelper
    def avatar_selection
        avatar_array = ["/images/avatar0.png", "/images/avatar1.png", "/images/avatar2.png", "/images/avatar3.png", "/images/avatar5.png", "/images/avatar6.png", "/images/avatar7.jpg"]
    end

    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!session[:user_id]
    end

end
module UserHelper
    def avatar_selection
        avatar_array = ["/images/avatar0.png", "/images/avatar1.png", "/images/avatar2.png", "/images/avatar3.png", "/images/avatar5.png", "/images/avatar6.png", "/images/avatar7.jpg"]
    end

    def current_user
        User.find_by(id: session[:user_id])
    end

    def num_of_challenges(regularity)
        if regularity == "daily"
            current_user.commitments.select {|c| c.challenge == "daily"}.size
        elsif regularity == "occasional"
            current_user.commitments.select {|c| c.challenge == "occasional"}.size
        end
    end

    def num_of_likes
        likes = 0
        current_user.posts.each do |p|
            likes += p.likes
        end
        likes
    end

   

end
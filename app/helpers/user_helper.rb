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

    def avg_point
        diff = (DateTime.now.utc - current_user.created_at).floor

        if diff == 0
           current_user.points
        else
            (current_user.points / diff).round
        end

    end

    def performance
        if current_user.goal.nil?
            "You have not set a goal yet."
        else
            diff = avg_point.to_f / current_user.goal.to_f
            if diff > 1.0
                "+#{(diff - 1.0) * 100}%"
            elsif diff < 1.0
                "-#{(1.0 - diff) * 100}%"
            else
                "100%"
            end
        end
    end

end 
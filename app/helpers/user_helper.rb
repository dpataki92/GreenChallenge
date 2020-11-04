module UserHelper

    # returns all posts from current user's groups in descending order
    def newsfeed(user)
        arr = []
        user.groups.each do |g|
            g.posts.each do |p|
                arr << p
            end
        end
        arr.sort {|a,b| b.created_at <=> a.created_at}
    end

    # returns all built-in profile pictures
    def avatar_selection
        avatar_array = ["/images/avatar0.png", "/images/avatar1.png", "/images/avatar2.png", "/images/avatar3.png", "/images/avatar5.png", "/images/avatar6.png", "/images/avatar7.jpg"]
    end

    # returns current user
    def current_user
        User.find_by(id: session[:user_id])
    end

    # returns the number of current user's challenges based on regularity
    def num_of_challenges(regularity)
        if regularity == "daily"
            current_user.commitments.select {|c| c.regularity == "daily"}.size
        elsif regularity == "occasional"
            current_user.commitments.select {|c| c.regularity == "occasional"}.size
        end
    end

    # returns the number of likes on current user's posts
    def num_of_likes
        likes = 0
        current_user.posts.each do |p|
            likes += p.likes
        end
        likes
    end

    # returns the daily average points of current user
    def avg_point
        diff = ((DateTime.now.utc - current_user.created_at)/86400).floor

        if diff == 0
           current_user.points
        else
            (current_user.points.to_f / diff.to_f).round(1)
        end

    end

    # returns the (positive or negative) difference between current user's average daily point goal and its actual average daily points 
    def performance
        if current_user.goal.nil?
            "You have not set a goal yet."
        else
            diff = (avg_point.to_f / current_user.goal.to_f)
            if diff > 1.0
                "+#{((diff - 1.0) * 100).round(2)}%"
            elsif diff < 1.0
                "-#{((1.0 - diff) * 100).round(2)}%"
            else
                "100%"
            end
        end
    end

end 
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

    def sort_groups
        if params[:value] == "creation"
            @groups = Group.order(created_at: :desc)
        elsif params[:value] == "users"
            @groups = Group.all.sort {|a, b| b.users.size <=> a.users.size}
        elsif params[:value] == "alphabet"
            @groups = Group.all.sort {|a, b| a.name <=> b.name}
        end
    end

    def group_member?(group)
        current_user.groups.include?(group)
    end

    def group_creator?(group)
        current_user.memberships.created.find {|m| m.group == group}
    end

    def add_or_remove_challenges_to_group(challenges, group)
        if params[:add]
            challenges.each do |c|
                if !group.challenges.include?(Challenge.find_by(title: c))
                    group.challenges << Challenge.find_by(title: c)
                    group.save
                end
            end
        elsif params[:remove]
            challenges.each do |c|
                if group.challenges.include?(Challenge.find_by(title: c))
                    group.challenges.delete(Challenge.find_by(title: c))
                end
            end
        end
    end

end

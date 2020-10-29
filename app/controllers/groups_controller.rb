class GroupsController < ApplicationController
    include UserHelper
    layout "users"

    # displays all groups based on creation date in descending order
    def index
        if logged_in?
            @group = Group.new
            @groups = Group.recent
        else
            redirect_to "/"
        end
    end

    # renders individual group show page along with its forum
    def show
        if logged_in?
            @group = Group.find_by(id: params[:id])
            @challenges = @group.challenges
            @group_creator = group_creator?(@group)
            @group_member = group_member?(@group)
        else
            redirect_to "/"
        end
    end

    # renders edit group page if user created the group
    def edit
        @group = Group.find_by(id: params[:id])

        if logged_in? && group_creator?(@group)
            render :edit
        else
            redirect_to group_path(@group)
        end
    end

    # creates new group and assigns it to current user
    def create
        @group = Group.new(group_params)
        @groups = Group.recent

        if @group.save
            current_user.memberships.create(group: @group, membership_type: "creator")
            redirect_to group_path(@group)
        else
            render :index
        end
    end

    # updates group data if user is the group creator
    def update
        @group = Group.find_by(id: params[:id])

        if @group.update(group_params) && group_creator?(@group)
            redirect_to groups_path
        else
            render :edit
        end
    end
    
    # deletes group if user is the group creator
    def destroy
        @group = Group.find_by(id: params[:id])

        if group_creator?(@group)
            @group.destroy
            redirect_to groups_path, notice: "You have deleted your group."
        else
            redirect_to group_path(@group)
        end
    end

    # returns sorting results based on user input
    def sort
        sort_groups
        @group = Group.new
        render :index
    end

    # pushes all group challenges to user's challenge collection with regard to regularity
    def commit_all
        if logged_in?
            @group = Group.find_by(id: params[:id])

            @group.challenges.each do |ch|
                if !current_user.challenges.include?(ch)
                    if params[:value] == "daily"
                        current_user.commitments.create(challenge: ch, regularity: "daily")
                    elsif params[:value] == "occasional"
                        current_user.commitments.create(challenge: ch, regularity: "occasional")
                    end
                end
            end
            redirect_to group_path(@group), notice: "You have commited to all the challenges of this group!"
        else
            redirect_to "/"
        end
    end

    # renders group challenges that are not already included in user's challenge collection
    def sort_challenges
        if logged_in?
            @group = Group.find_by(id: params[:id])
            @challenges = @group.challenges.select {|ch| !current_user.challenges.include?(ch)}

            render :show
        else
            redirect_to "/"
        end
    end

    # lists all challenges to add to group's challenges if user is the creator
    def group_challenges
        @group = Group.find_by(id: params[:id])

        if logged_in? && group_creator?(@group)
            render :group_challenges
        else
            redirect_to "/"
        end
    end

    # pushes selected challenges to group's challenges if it's not included already
    def edit_challenges
        @group = Group.find_by(id: params[:id])
        @challenges = params[:group_challenges]

        add_or_remove_challenges_to_group(@challenges, @group)

        redirect_to group_path(@group)
    end

    # shows forum if user is a group member
    def forum
        if logged_in?
            @group = Group.find_by(id: params[:id])

            if group_member?(@group)
                @forum = true
                @posts = @group.posts
                @challenges = @group.challenges
                @group_member = group_member?(@group)

                render :show
            else
                redirect_to group_path(@group), notice: "Only members can see the forum. Please join the group."
            end
        else
            redirect_to "/"
        end
    end

    # joins user to group
    def join
        @group = Group.find_by(id: params[:id])

        if !group_member?(@group)
            current_user.groups << @group
            current_user.save
        end

        redirect_to group_path(@group), notice: "You have successfully joined the group!"
    end

    # lets user leave the group if user is a member
    def leave
        @group = Group.find_by(id: params[:id])

        if logged_in? && group_member?(@group)
            current_user.groups.delete(@group)
            redirect_to groups_path, notice: "You have successfully left the group!"
        else
            redirect_to "/"
        end
    end

    # removes all group challenges from user's challenge collection
    def uncommit_all
        @group = Group.find_by(id: params[:id])

        if logged_in? && group_member?(@group)
            
            @group.challenges.each do |c|
                current_user.challenges.delete(c)
            end

            redirect_to group_path(@group)
        else
            redirect_to "/"
        end
    end
    
    private

    def group_params
        params.require(:group).permit(:name, :description)
    end
end
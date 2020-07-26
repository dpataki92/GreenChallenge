class GroupsController < ApplicationController
    include UserHelper
    layout "users"

    # displaying all groups in descending order
    def index
        @groups = Group.recent
    end

    # rendering individual group show page with forum
    def show
        @group = Group.find_by(id: params[:id])
        @challenges = @group.challenges
    end

    # rendering edit group page if user created the group
    def edit
        @group = Group.find_by(id: params[:id])

        if current_user.memberships.created.find {|m| m.group == @group}
            render :edit
        else
            redirect_to group_path(@group)
        end
    end

    def create
        @group = Group.new(group_params)

        if @group.save
            current_user.memberships.create(group: @group, membership_type: "creator")
            redirect_to group_path(@group)
        else
            render :index
        end

    end

    def update
        @group = Group.find_by(id: params[:id])

        if @group.update(group_params)
            redirect_to groups_path
        else
            redirect_to edit_group_path(@group), notice: "Sorry, invalid data."
        end
    end
    
    def destroy
        Group.find_by(id: params[:id]).destroy

        redirect_to groups_path
    end

    def sort
        sort_groups
        render :index
    end

    def commit_all
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
    end

    def sort_challenges
        @group = Group.find_by(id: params[:id])
        @challenges = @group.challenges.select {|ch| !current_user.challenges.include?(ch)}

        render :show
    end

    def group_challenges
        @group = Group.find_by(id: params[:id])
    end

    def edit_challenges
       
        @group = Group.find_by(id: params[:id])
        @challenges = params[:group_challenges]

        if params[:add]
            @challenges.each do |c|
                if !@group.challenges.include?(Challenge.find_by(title: c))
                    @group.challenges << Challenge.find_by(title: c)
                    @group.save
                end
            end
        elsif params[:remove]
            @challenges.each do |c|
                if @group.challenges.include?(Challenge.find_by(title: c))
                    @group.challenges.delete(Challenge.find_by(title: c))
                end
            end
        end

        redirect_to group_path(@group)
    end

    def forum
        @group = Group.find_by(id: params[:id])

        if current_user.groups.include?(@group)
            @forum = true
            @posts = @group.posts
            @challenges = @group.challenges

            render :show
        else
            redirect_to group_path(@group), notice: "Only members can see the forum. Please join the group."
        end
    end

    def join
        @group = Group.find_by(id: params[:id])

        if !current_user.groups.include?(@group)
            current_user.groups << @group
            current_user.save
        end

        redirect_to group_path(@group), notice: "You have successfully joined the group!"
    end
    
    def leave
        @group = Group.find_by(id: params[:id])
        if current_user.groups.include?(@group)
            current_user.groups.delete(@group)
        end

        redirect_to groups_path, notice: "You have successfully left the group!"
    end

    def uncommit_all
        @group = Group.find_by(id: params[:id])
        
        @group.challenges.each do |c|
            current_user.challenges.delete(c)
        end

        redirect_to group_path(@group)
    end
    
    private

    def group_params
        params.require(:group).permit(:name, :description)
    end
end
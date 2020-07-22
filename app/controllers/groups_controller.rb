class GroupsController < ApplicationController
    include UserHelper
    
    layout "users"

    def index
        @groups = Group.order(created_at: :desc)
    end

    def show
        @group = Group.find_by(id: params[:id])
        @challenges = @group.challenges
    end

    def new
    end

    def edit
    end

    def create
        @group = Group.new(group_params)

        if @group.save
            redirect_to group_path(@group)
        else
            render :index
        end

    end

    def update
    end
    
    def destroy
    end

    def sort
        if params[:value] == "creation"
            @groups = Group.order(created_at: :desc)
        elsif params[:value] == "users"
            @groups = Group.all.sort {|a, b| b.users.size <=> a.users.size}
        elsif params[:value] == "alphabet"
            @groups = Group.all.sort {|a, b| a.name <=> b.name}
        end

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
    
    private

    def group_params
        params.require(:group).permit(:name, :description)
    end
end
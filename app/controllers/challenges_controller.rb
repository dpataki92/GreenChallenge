class ChallengesController < ApplicationController
    
    include UserHelper
    
    layout "users"

    def index
        @challenges = Challenge.order(created_at: :desc)
    end

    def show
        @challenge = Challenge.find_by(id: params[:id])
    end

    def new
    end

    def edit
        @challenge = Challenge.find_by(id: params[:id])
        
        if @challenge.creator == current_user.name
            render :edit
        else
            redirect_to challenges_path
        end
    end

    def create
        @challenge = Challenge.new(challenge_params)
        @challenge.creator = current_user.name

        if @challenge.save
            redirect_to challenge_path(@challenge)
        else
            @challenges = Challenge.order(created_at: :desc)
            render :index
        end
    end

    def update
        @challenge = Challenge.find_by(id: params[:id])

        if @challenge.update(challenge_params)
            redirect_to challenges_path
        else
            redirect_to edit_challenge_path(@challenge)
        end
    end
    
    def destroy
    end

    def sort
        if params[:value] == "creation"
            @challenges = Challenge.order(created_at: :desc)
        elsif params[:value] == "users"
            @challenges = Challenge.all.sort {|a, b| b.users.size <=> a.users.size}
        elsif params[:value] == "alphabet"
            @challenges = Challenge.all.sort {|a, b| a.title <=> b.title}
        end
       
        render :index
    end

    private

    def challenge_params
        params.require(:challenge).permit(:title, :description, :creator)
    end
end
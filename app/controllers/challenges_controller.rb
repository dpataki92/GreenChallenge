class ChallengesController < ApplicationController
    
    include UserHelper
    
    layout "users"

    def index
        @challenges = Challenge.all
    end

    def show
    end

    def new
    end

    def edit
    end

    def create
        @challenge = Challenge.new(challenge_params)
        
        if @challenge.save
            @challenge.creator = current_user.name
            redirect_to challenges_path
        else
            @challenges = Challenge.all
            render :index
        end
    end

    def update
    end
    
    def destroy
    end

    private

    def challenge_params
        params.require(:challenge).permit(:title, :description)
    end
end
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
        Challenge.find_by(id: params[:id]).destroy
        redirect_to challenges_path
    end

    def sort
        if params[:value] == "creation"
            @challenges = Challenge.order(created_at: :desc)
        elsif params[:value] == "users"
            @challenges = Challenge.all.sort {|a, b| b.users.size <=> a.users.size}
        elsif params[:value] == "alphabet"
            @challenges = Challenge.all.sort {|a, b| a.title <=> b.title}
        elsif params[:value] == "me"
            @challenges = Challenge.where(:creator => current_user.name)
        end
       
        render :index
    end

    def commit
        @challenge = Challenge.find_by(id: params[:id])

        current_user.commitments.create(challenge: @challenge, regularity: params[:regularity])

        redirect_to challenge_path(@challenge)
    end

    def uncommit
        @challenge = Challenge.find_by(id: params[:id])

        current_user.challenges.delete(@challenge)

        redirect_to challenge_path(@challenge)
    end

    private

    def challenge_params
        params.require(:challenge).permit(:title, :description, :creator)
    end
end
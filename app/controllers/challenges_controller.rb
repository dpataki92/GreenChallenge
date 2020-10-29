class ChallengesController < ApplicationController
    include UserHelper
    layout "users"

    # renders page with all challenges and sorting links
    def index
        if logged_in?
            @challenges = Challenge.recent
            @challenge = Challenge.new
            render :index
        else
            redirect_to "/"
        end
    end

    # renders show page of a certain challenge
    def show
        if logged_in?
            @challenge = Challenge.find_by(id: params[:id])
            render :show
        else
            redirect_to "/"
        end
    end

    # renders edit page if the challenge belongs to current user
    def edit
        if logged_in?
            @challenge = Challenge.find_by(id: params[:id])
            if @challenge.creator == current_user.name
                render :edit
            else
                redirect_to challenges_path
            end
        else
            redirect_to "/"
        end
    end

    # creates new challenge and validates data
    def create
        @challenge = Challenge.new(challenge_params)
        @challenge.creator = current_user.name

        if @challenge.save
            redirect_to challenge_path(@challenge)
        else
            @challenges = Challenge.recent
            render :index
        end
    end

    # updates data of individual challenge
    def update
        @challenge = Challenge.find_by(id: params[:id])

        if @challenge.update(challenge_params) && @challenge.creator == current_user.name
            redirect_to challenges_path
        else
            redirect_to edit_challenge_path(@challenge)
        end
    end
    
    # deletes challenge
    def destroy
        @challenge = Challenge.find_by(id: params[:id])

        if logged_in? && @challenge.creator == current_user.name
            @challenge.destroy
            redirect_to challenges_path
        else
            redirect_to challenge_path(@challenge)
        end
    end

    # returns sorting results based on user input
    def sort
        sort_challenges
        @challenge = Challenge.new
        render :index
    end

    # adds challenge to user's challenges if user did not add the challenge before
    def commit
        @challenge = Challenge.find_by(id: params[:id])

        if !current_user.challenges.include?(@challenge)
            current_user.commitments.create(challenge: @challenge, regularity: params[:regularity])
        end

        redirect_to challenge_path(@challenge)
    end

    # removes challenge from user's challenges
    def uncommit
        @challenge = Challenge.find_by(id: params[:id])

        if current_user.challenges.include?(@challenge)
            current_user.challenges.delete(@challenge)
        end

        redirect_to challenge_path(@challenge)
    end

    private

    def challenge_params
        params.require(:challenge).permit(:title, :description, :creator)
    end
end
class ChallengesController < ApplicationController
    include UserHelper
    layout "users"

    # rendering page with all challenges and sorting links
    def index
        if logged_in?
            @challenges = Challenge.recent
            @challenge = Challenge.new
            render :index
        else
            redirect_to "/"
        end
    end

    # rendering show page for individual challenge
    def show
        if logged_in?
            @challenge = Challenge.find_by(id: params[:id])
            render :show
        else
            redirect_to "/"
        end
    end

    # rendering edit page if challenge belongs to current user
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

    # creating new challenge and validating data
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

    # updating data of individual challenge
    def update
        @challenge = Challenge.find_by(id: params[:id])

        if @challenge.update(challenge_params) && @challenge.creator == current_user.name
            redirect_to challenges_path
        else
            redirect_to edit_challenge_path(@challenge)
        end
    end
    
    # deleting challenge
    def destroy
        @challenge = Challenge.find_by(id: params[:id])

        if logged_in? && @challenge.creator == current_user.name
            @challenge.destroy
            redirect_to challenges_path
        else
            redirect_to challenge_path(@challenge)
        end
    end

    # returning sorting results based on user input
    def sort
        sort_challenges
        @challenge = Challenge.new
        render :index
    end

    # adding challenge to user's challenges if user hasn't commited to it before
    def commit
        @challenge = Challenge.find_by(id: params[:id])

        if !current_user.challenges.include?(@challenge)
            current_user.commitments.create(challenge: @challenge, regularity: params[:regularity])
        end

        redirect_to challenge_path(@challenge)
    end

    # removing challenge from user's challenges
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
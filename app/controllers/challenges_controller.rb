class ChallengesController < ApplicationController
    include UserHelper
    layout "users"

    # rendering page with all challenges and sorting links
    def index
        if logged_in?
            @challenges = Challenge.recent
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

        if !current_user.challenges.include?(@challenge)
            current_user.commitments.create(challenge: @challenge, regularity: params[:regularity])
        end

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
class ChallengesController < ApplicationController
    
    include UserHelper
    
    layout "users"

    def index
        @user = current_user
        @challenges =  Challenge.all
    end

    def show
    end

    def new
    end

    def edit
    end

    def create
    end

    def update
    end
    
    def destroy
    end
end
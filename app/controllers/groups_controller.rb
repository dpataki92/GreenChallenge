class GroupsController < ApplicationController
    include UserHelper
    
    layout "users"

    def index
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

    
    private

    def group_params
        params.require(:group).permit(:name, :description)
    end
end
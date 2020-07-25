class PostsController < ApplicationController
    include UserHelper
    
    layout "users"
    
    def show
        @post = Post.find_by(id: params[:id])
    end

    def edit
    end

    def create
        @group = Group.find_by(name: params[:post][:group])

        @post = current_user.posts.create(post_params)
        @post.group = @group
        @post.save
        redirect_to "/users/#{params[:user_id]}/posts/#{@post.id}"
    end

    def update
    end

    private

    def post_params
        params.require(:post).permit(:title, :content)
    end
end
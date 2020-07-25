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

    def post_like
        @user = User.find_by(id: params[:user_id])
        @post = @user.posts.find_by(id: params[:id])
        @post.likes += 1
        @post.save

        redirect_to user_post_path(@post)
    end

    def post_commen
        @post = Post.find_by(id: params[:id])
        @comment = @post.comments.create(comment_params)
        @post.save
        @comment.user = current_user
        @comment.save
        
        redirect_to user_post_path(@post)
    end

    private

    def post_params
        params.require(:post).permit(:title, :content)
    end

    def comment_params
        params.require(:comment).permit(:content)
    end
end
class PostsController < ApplicationController
    include UserHelper
    
    layout "users"
    
    # shows post with related comments if user is group member of post's group
    def show
        @post = Post.find_by(id: params[:id])
        @comment = Comment.new
        
        if logged_in? && group_member?(@post.group)
            render :show
        else
            redirect_to "/"
        end
    end

    # renders edit post page if post belongs to current user
    def edit
        @post = Post.find_by(id: params[:id])
        @user = User.find_by(id: params[:user_id])

        if logged_in? && @post.user == current_user
            render :edit
        else
            redirect_to "/"
        end
    end

    # creates new post and assigns it to group and user
    def create
        @group = Group.find_by(name: params[:post][:group])
        @post = current_user.posts.build(post_params)

        if @post
            @post.group = @group
            @post.save
            redirect_to "/users/#{params[:user_id]}/posts/#{@post.id}"
        else
            redirect_to "/", notice: "Sorry, invalid post data!"
        end
    end

    # updates post data if post belongs to user
    def update
        @post = Post.find_by(id: params[:id])

        if @post.update(post_params) && @post.user == current_user
            redirect_to user_post_path(@post)
        else
            redirect_to "/"
        end
    end

    # deletes post if it belongs to curren user
    def destroy
        @post = Post.find_by(id: params[:id])

        if @post.user == current_user
            @post.destroy
            redirect_to user_path(current_user), notice: "You have deleted your post."
        else
            redirect_to "/"
        end
    end

    # adds a like to post's likes and adds a point to user's points
    def post_like
        @user = User.find_by(id: params[:user_id])
        @post = @user.posts.find_by(id: params[:id])

        if @post.user != current_user
            @post.likes += 1
            @post.save
            @user.points += 1
            @user.save
            
            redirect_to user_post_path(@post)
        else
            redirect_to user_post_path(@post), notice: "Sorry, you can't like your own post."
        end
    end

    # adds comment to post and assigns it to user
    def post_comment
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
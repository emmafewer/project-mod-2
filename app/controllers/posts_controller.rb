class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy, :add_likes]

    layout "post"

    def index
        @posts = Post.all
        if params[:user_id]
            @user = User.where('name LIKE ?', "%#{params[:user_id]}%")
        end
        @users = User.all
        @comment = Comment.new 
    end

    def show 
        @users = User.all
        @comment = Comment.new
        @comment.post_id = @post.id
    end 

    def new
        @post = Post.new
        @users = User.all
    end

    def create
        @post = Post.new(post_params)
        @post.likes = 0
        @post.user_id = current_user.id
        if @post.valid?
            @post.save
            redirect_to posts_path
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to new_post_path
        end
    end

    def edit
        @users = User.all
    end

    def update
        @post.update(post_params)
        if @post.valid?
            redirect_to posts_path
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to edit_post_path
        end
    end

    def add_likes
        @post.update(likes: @post.likes + 1)
        redirect_to posts_path
    end

    def destroy
        @post.destroy
        redirect_to posts_path
    end

    private 

    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :content, :image)
    end
end

 
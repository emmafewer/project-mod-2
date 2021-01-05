class PostsController < ApplicationController

    def index
        @posts = Post.all
        if params[:user_id]
            @user = User.where('name LIKE ?', "%#{params[:user_id]}%")
        end
        @users = User.all
        @comment = Comment.new
    end

    def show 
        @post = Post.find(params[:id])
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
        @post.save
        redirect_to posts_path
    end

    private 

    def post_params
        params.require(:post).permit(:title, :content, :image, :user_id)
    end
end

 
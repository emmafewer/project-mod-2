class PostsController < ApplicationController

    def index
        @posts = Post.all
        if params[:user_id]
            @user = User.where('name LIKE ?', "%#{params[:user_id]}%")
        end
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
        @post = Post.create(post_params)
        redirect_to posts_path
    end

    private 

    def post_params
        params.require(:post).permit(:title, :content, :image, :likes, :user_id)
    end
end

 
class CommentsController < ApplicationController

    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.new(comment_params)
        if @comment.valid?
            @comment.post_id = params[:post_id]
            @comment.save
        else
            flash[:errors] = @comment.errors.full_messages
        end
        redirect_to posts_path
    end


    private

    def comment_params
        params.require(:comment).permit(:content, :user_id)
    end

end

class CommentsController < ApplicationController
    def create
        # Here, instead of following the JumpStartLab tutorial, 
        # I copied the menthod used in the far more current Rails Guides tutorial.
        # https://guides.rubyonrails.org/getting_started.html#generating-a-controller
        
        #@comment = Comment.new(comment_params)
        #@comment.article_id = params[:article_id]
        #@comment.save

        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)

        flash.notice = "Comment saved!"
        redirect_to article_path(@comment.article)
    end


    private
    def comment_params
        params.require(:comment).permit(:author_name, :body)
    end
end

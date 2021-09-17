class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article

  def create
    @comment = @article.comments.build(comment_params)
    @comment.author = current_user
    if @comment.save
      flash[:notice] = "Comment has been created"
      redirect_to article_path(@article)
    else
      flash.now[:alert] = "Comment has not been created."
      render "articles/show"
    end
  end










  private

    def set_article
      @article = Article.find_by_permalink(params[:article_id])
      # @article = Article.find(params[:article_id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end

class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: %i(create destroy)

  def index
    @likes = Like.where(user: current_user)
    @categories = Category.includes(:articles).order(:name)
    @levels = Level.includes(:articles)
  end

  def create
    like = current_user.like(@article)
    if like
      flash[:notice] = "Article liked"
      redirect_to article_path(@article)
    end

    rescue ActiveRecord::RecordInvalid
      flash[:alert] = "You've already liked tutorial"
      redirect_to article_path(@article)
  end

  def destroy
    unlike = current_user.unlike(@article)
    flash[:notice] = "Article unliked"
    redirect_to article_path(@article)
  end



  private

    def set_article
      # @article ||= Article.find(params[:id])
      @article ||= Article.find_by_permalink(params[:id])
    end
end

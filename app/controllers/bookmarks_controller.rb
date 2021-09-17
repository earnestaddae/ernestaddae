class BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: %i(create destroy)

  def index
    @bookmarks = Bookmark.where(user: current_user)
    @categories = Category.includes(:articles).order(:name)
    @levels = Level.includes(:articles)
  end

  def create
    bookmark = current_user.bookmark(@article)
    if bookmark
      flash[:notice] = "Article bookmarked"
      redirect_to article_path(@article)
    end

    rescue ActiveRecord::RecordInvalid
      flash[:alert] = "You've already bookmarked tutorial"
      redirect_to article_path(@article)
  end

  def destroy
    unbookmark = current_user.unbookmark(@article)
    flash[:notice] = "Article unbookmarked"
    redirect_to article_path(@article)
  end



  private

    def set_article
      # @article ||= Article.find(params[:id])
      @article ||= Article.find_by_permalink(params[:id])
    end
end

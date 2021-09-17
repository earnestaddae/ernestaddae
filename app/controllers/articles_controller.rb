class ArticlesController < ApplicationController
  # before_action :authenticate_user!, except: %i(index show)
  # before_action :check_article_author, only: %i(edit update destroy)
  before_action :set_article, only: %i(show)


  def index
    @articles = Article.published
    @featured = Article.published.first
  end


  def show
    @article = Article.includes(:comments).find_by_permalink(params[:id])
    @comment = Comment.new
  end






  private

    def set_article
      # @article = Article.find(params[:id])
      @article = Article.find_by_permalink(params[:id])

      rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The article you were looking for could not be found."
      redirect_to articles_path
    end
end

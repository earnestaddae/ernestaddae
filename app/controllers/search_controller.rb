class SearchController < ApplicationController
  def index
    if params[:query].present?
      @articles = Article.published.search_article(params[:query])
    else
      @articles = Article.published
    end

    @categories = Category.includes(:articles).order(:name)
    @levels = Level.includes(:articles)
  end
end

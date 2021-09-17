class TagsController < ApplicationController

  def index
    @tags = Tag.includes(:articles).order(:name)
  end

  def show
    @tag = Tag.includes(:articles).find(params[:id])
  end

  def destroy
    # @article = Article.find(params[:article_id])
    @article = Article.find_by_permalink(params[:article_id])

    @tag = Tag.find(params[:id])
    @article.tags.destroy(@tag)

    head :ok
  end
end

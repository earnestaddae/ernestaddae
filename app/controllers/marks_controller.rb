class MarksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: %i(create destroy)

  def index
    @marks = Mark.where(user: current_user)
    @categories = Category.includes(:articles).order(:name)
    @levels = Level.includes(:articles)
  end

  def create
    mark = current_user.mark(@article)
    if mark
      flash[:notice] = "Article marked"
      redirect_to article_path(@article)
    end

    rescue ActiveRecord::RecordInvalid
      flash[:alert] = "You've already marked tutorial"
      redirect_to article_path(@article)
  end

  def destroy
    unmark = current_user.unmark(@article)
    flash[:notice] = "Article unmarked"
    redirect_to article_path(@article)
  end



  private

    def set_article
      # @article ||= Article.find(params[:id])
      @article ||= Article.find_by_permalink(params[:id])
    end
end

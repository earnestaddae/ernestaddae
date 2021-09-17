class CategoriesController < ApplicationController
  def index
    @categories = Category.includes(:articles).order(:name)
  end

  def show
    @category = Category.includes(:articles).find(params[:id])
  end
end

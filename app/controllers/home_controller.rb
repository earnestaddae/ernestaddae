class HomeController < ApplicationController
  def index
    @articles = Article.published
    @featured = Article.published.first
  end

  def start
  end

  def become_writer
  end
end

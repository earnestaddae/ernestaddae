class StartHereController < ApplicationController
  def index
  end


  def ruby_basics
    @basics = Article.beginner
  end

  def ruby_intermediate
    @intermediates = Article.intermediate
  end

  def learn_rails
    @rails = Article.rails
  end

end

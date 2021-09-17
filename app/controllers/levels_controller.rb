class LevelsController < ApplicationController
  def show
    @level = Level.find(params[:id])
  end
end

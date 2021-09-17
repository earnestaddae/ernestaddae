class UsersController < ApplicationController
  before_action :set_user, only: %i(show)
  def index
    @users = User.users_with_articles
  end

  def show
  end




  private

    def set_user
      @user = User.find(params[:id])
    end
end

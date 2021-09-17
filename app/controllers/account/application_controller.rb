class Account::ApplicationController < ApplicationController
  before_action :authorize_user!

  def index
    @user = current_user
    if current_user.profile.present?
      @profile = current_user.profile
    else
      @profile = Profile.new
    end
  end




  private

    def authorize_user!
      authenticate_user!

      unless current_user
        redirect_to root_path, alert: "Only authenticated users can access that page"
      end

    end
end

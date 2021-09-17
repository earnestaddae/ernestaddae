class Writer::ApplicationController < ApplicationController
  before_action :authorize_writer!
  layout "adminlte"

  def index
    @user = current_user
    @profile = @user.profile
  end





  private

    def authorize_writer!
      authenticate_user!

      unless (current_user.try(:admin?)) || (current_user.has_role?(:writer))
        redirect_to root_path, alert: "Only authors are allowed to do that"
      end
    end
end

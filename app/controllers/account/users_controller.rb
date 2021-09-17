class Account::UsersController < Account::ApplicationController
  before_action :find_user, only: [:update]



  def update
    if @user.update(user_params)
      flash[:notice] = "Username has been updated."
    else
      flash[:notice] = "Username remain unchanged"
    end

    redirect_to account_root_path
  end


  private

    def find_user
      @user = current_user
    end

    def user_params
      params.require(:user).permit(:username)
    end
end

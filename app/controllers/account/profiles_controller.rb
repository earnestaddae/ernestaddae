class Account::ProfilesController < Account::ApplicationController
  # before_action :check_user_profile, only: %i(new create)
  before_action :set_user_profile, only: %i(update)

  def new
    @profile = Profile.new
  end


  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    if @profile.save
      flash[:notice] = "Profile has been created."
      redirect_to account_root_path
    else
      flash.now[:alert] = "Profile has not been created."
      # redirect_to account_root_path
      render "new"
    end
  end

  def update
    if @profile.update(profile_params)
      flash[:notice] = "Profile has been updated."
    else
      flash.now[:notice] = "Profile updated successfully."
    end

    redirect_to account_root_path
  end




  private

    def profile_params
      params.require(:profile).permit(:first_name, :last_name)
    end

    # def check_user_profile
    #   if current_user.profile.present?
    #     flash[:notice] = "You can have one profile."
    #     redirect_to writer_root_path
    #   end
    # end

    def set_user_profile
      @profile = current_user.profile
    end
end

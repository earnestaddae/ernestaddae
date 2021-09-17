class Admin::UsersController < Admin::ApplicationController
  before_action :set_user, only: %i(show edit update destroy)

  def index
    @users = User.includes(:roles).order(:username)
  end

  def show
  end

  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "User has been created."
      redirect_to admin_users_path
    else
      flash.now[:alert] = "User has not been created."
      render "new"
    end
  end

  def edit
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
    end

    # @user.remove_role :reader if @user.has_role? :reader
    # @user.remove_role :writer if @user.has_role? :writer
    @user.add_role params[:user][:role].to_sym

    if @user.update(user_params.except(:role))
      flash[:notice] = "User has been updated."
      redirect_to admin_users_path
    else
      flash.now[:alert] = "User has not been updated."
      render "edit"
    end
  end


  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :admin, :role)
    end

    def set_user
      @user = User.find(params[:id])
    end
end

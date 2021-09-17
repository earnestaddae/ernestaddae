class SubscriptionsController < ApplicationController
  before_action :find_user


  def new
    @subscription = @user.subscriptions.new
  end

  def create
    @user.subscriptions.create(subscription_params)

    if @user.save
      flash[:notice] = "You are subscribed to #{@user}"
      redirect_to(user_path(@user))
    else
      flash[:alert] = "Your subscription to #{@user} wasn't successful"
      # render :new
      redirect_to new_subscribe_user_path(@user)
    end


    rescue ActiveRecord::RecordNotUnique
      flash[:alert] = "You are already subscribed to #{@user}"
      redirect_to(user_path(@user))
  end


  private
    def find_user
      @user = User.find(params[:id])
    end

    def subscription_params
      params.require(:subscription).permit(:email)
    end
end

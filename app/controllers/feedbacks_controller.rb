class FeedbacksController < ApplicationController

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    # if verify_recaptcha(model: @feedback) && @feedback.save
    if @feedback.save
      flash[:notice] = "Thanks for your suggestion. We appreciate your feedback"
      redirect_to root_path
    else
      flash.now[:alert] = "Your feedback wasn't sent"
      render "new"
    end
  end




  private

    def feedback_params
      params.require(:feedback).permit(:message, :name, :email)
    end
end

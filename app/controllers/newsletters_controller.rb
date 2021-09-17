class NewslettersController < ApplicationController
  before_action :set_newsletter, only: [:show]

  def index
    @newsletter = Newsletter.new
  end

  def new
    @newsletter = Newsletter.new
  end

  def create
    @newsletter = Newsletter.new(newsletter_params)

    if @newsletter.save
      flash[:notice] = "You are subscribed to our newsletter"
      redirect_to newsletter_path(@newsletter)
    else
      flash.now[:alert] = "Your subscription wasn't created"
      render "new"
    end
  end

  def show
  end


  private

    def set_newsletter
      @newsletter = Newsletter.find(params[:id])
    end

    def newsletter_params
      params.require(:newsletter).permit(:name, :email)
    end
end

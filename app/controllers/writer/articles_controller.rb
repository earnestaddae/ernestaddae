class Writer::ArticlesController < Writer::ApplicationController
  before_action :check_article_author, only: %i(edit update destroy)
  before_action :set_article, only: %i(edit update destroy)

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.tags = processed_tags
    @article.author = current_user

    current_user.remove_role :reader if current_user.has_role? :reader
    current_user.add_role :writer unless current_user.has_role? :writer
    current_user.add_role(:author, @article)

    if params[:attachments].present?
      @article.attachments.attach(params[:attachments])
    end

    if @article.save
      @article.published! if publishing?
      @article.update(published_at: Time.zone.now) if publishing?
      @article.draft! if unpublishing? || saving_as_draft?

      flash[:notice] = "Tutorial has been created."
      redirect_to @article
    else
      flash.now[:alert] = "Tutorial has not been created."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      @article.published! if publishing?
      @article.draft! if unpublishing?
      @article.update(published_at: Time.zone.now) if publishing?
      @article.update(published_at: nil) if unpublishing? || saving_as_draft?
      @article.tags << processed_tags

      flash[:notice] = "Tutorial has been updated."
      redirect_to @article
    else
      flash.now[:alert] = "Tutorial has not been updated."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "Tutorial has been deleted"
    redirect_to articles_url
  end

  def upload_file
    blob = ActiveStorage::Blob.create_and_upload!(
      io: params[:file],
      filename: params[:file].original_filename
    )
    render json: { signedId: blob.signed_id }
  end

  private

    def article_params
      params.require(:article).permit(:title, :body, :summary, :category_id, :level_id, :attachment, attachments: [])
    end

    def set_article
      # @article = Article.find(params[:id])
      @article = Article.find_by_permalink(params[:id])

      rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The article you were looking for could not be found."
      redirect_to articles_path
    end

    # populates tag with tag_names
    def processed_tags
      params[:tag_names].split(",").map { |tag| Tag.find_or_initialize_by(name: tag) }
      # params[:tag_names].split(",").map { |tag| Tag.find_or_initialize_by(name: tag.strip) }
    end

    # allows the author of tutorial to edit, update or destroy their own
    def check_article_author
      @article = Article.find_by_permalink(params[:id])
      unless (current_user == @article&.author && current_user.has_role?(:author, @article)) || current_user.try(:admin?)
        redirect_to articles_path, alert: "You are not the author of that article."
      end
    end

    def publishing?
      params[:commit] == "Publish"
    end

    def unpublishing?
      params[:commit] == "Unpublish"
    end

    def saving_as_draft?
      params[:commit] == "Save as Draft"
    end


end

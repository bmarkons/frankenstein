class CommentsController < ApplicationController
  before_action :set_accommodation
  before_action :set_comment, only: [:edit, :update, :destroy, :show]

  def index
    @comments =
      if @accommodation.present?
        @accommodation.comments
      else
        if current_user.type == "admin"
          Comment.all
        elsif current_user.type == "manager"
          Comment.managed_by(current_user)
        elsif current_user.type == "user"
          Comment.posted_by(current_user)
        end
      end
  end

  def new
    unless @accommodation.commented_by?(current_user) || current_user.type != "user"
      @comment = Comment.new
    else
      redirect_to accommodation_comments_url
    end
  end

  def create
    unless @accommodation.commented_by?(current_user) || current_user.type != "user"
      @comment = @accommodation.comments.build(comment_params)
      @comment.user = current_user

      respond_to do |format|
        if @comment.save
          format.html { redirect_to accommodation_comments_path(@accommodation, @comment), notice: 'Comment was successfully created.' }
          format.json { render :show, status: :created, location: @comment }
        else
          format.html { render :new }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to comments_path
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy unless current_user.type == "manager"
    if @accommodation.present?
      redirect_to accommodation_comments_url(@accommodation), notice: "You can't destroy comment"
    else
      redirect_to comments_url, notice: 'Comment was successfully destroyed.'
    end
  end

  private

  def set_accommodation
    if params[:accommodation_id].present?
      @accommodation = Accommodation.find(params[:accommodation_id])
    end
  end

  def set_comment
    @comment = current_user.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:grade, :text, :accommodation_id, :user_id)
  end
end

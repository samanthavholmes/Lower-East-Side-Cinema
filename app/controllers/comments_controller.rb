class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    if logged_in?
      @comment = Comment.new
    else
      render "_unauthorized"
    end
  end

  def create
    if logged_in? && @comment.save
    @comment = @comment.new(comment_params)
      redirect_to film_path
      # RENDER review partial??
    elsif logged_in? && !@comment.save
      render 'new'
    else
      render "_unauthorized"
    end
  end

  def edit
    if logged_in?
  end

  def update
    if logged_in? && @comment.update(comment_params)
      redirect_to film_path(@film)
      # RENDER review partial??
    elsif logged_in? && !@comment.update
      render 'edit'
    else
      render "_unauthorized"
    end
  end

  def destroy
    if logged_in?
    end
  end

  private

  def set_comment
    @comment = Comment.find_by(id: params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end

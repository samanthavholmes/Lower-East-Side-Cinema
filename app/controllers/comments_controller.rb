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
    @comment = @comment.new(comment_params)
    if @comment.save
      redirect_to film_path
      # RENDER review partial??
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to film_path
      # RENDER review partial??
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def set_comment
    @comment = Comment.find_by(id: params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end

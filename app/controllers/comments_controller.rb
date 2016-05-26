class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    if logged_in?
      @rating = Rating.find_by(id: params[:rating_id])
      @comment = Comment.new
    else
      render "/_unauthorized"
    end
  end

  def create
    if logged_in?
      @rating = Rating.find_by(id: params[:comment][:rating_id])
      @comment = Comment.new(comment_params.merge(user_id: current_user.id, rating_id: @rating.id))
      if @comment.save
        redirect_to film_path(@comment.rating.film)
      # RENDER review partial??
      else
        render 'new'
      end
    else
      render "/_unauthorized"
    end
  end

  def edit
    if !is_commenter?
      render "/_unauthorized"
    end
  end

  def update
    if is_commenter? 
      if @comment.update(comment_params)
        redirect_to @film
        # RENDER review partial??
      else
        render 'edit'
      end
    else
      render "/_unauthorized"
    end
  end

  def destroy
    if !is_commenter?
      render "/_unauthorized"
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def is_commenter?
    @comment.user == current_user
  end

end

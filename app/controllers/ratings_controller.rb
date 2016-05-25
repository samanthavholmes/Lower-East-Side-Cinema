class RatingsController < ApplicationController
  before_action :set_rating, only: [:edit, :update, :destroy]


  def new
    if logged_in?
      @rating = Rating.new
    else
      render "/_unauthorized"
    en
  end

  def create
    if logged_in?
      @rating = Rating.new(rating_params)
      if @rating.save
        redirect_to @rating
      else
        render :new
      end
    else
      render "/unauthorized"
    end
  end

  def edit
    if !is_author?
      render "/unathorized"
    end
  end

  def update
    if is_author?
      if @rating.update(rating_params)
        redirect_to @rating
      else
        render :edit
      end
    else
      render "/_unauthorized"
    end
  end

  def destroy
    if is_author?
      @film = @rating.film
      @rating.destroy
      redirect_to @film
    else
      render "/_unauthorized"
    end
  end

private

  def set_rating
    @rating = Rating.find_by(id: params[:id])
  end

  def rating_params
    params.require(:rating).permit(:stars, :review, :film_id)
  end

  def is_author?
    @rating.user == current_user
  end

end

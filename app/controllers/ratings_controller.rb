class RatingsController < ApplicationController
  before_action :set_rating, only: [:edit, :update, :destroy]
  include UsersHelper


  def new
    @rating = Rating.new
    @film = Film.find_by(id: params[:film_id])
    if request.xhr?
      render partial: 'form', layout: false
      if !logged_in? || already_rated?(@film)
        render "/_unauthorized"
      end
    end
  end

  def create
    if logged_in?
      @rating = Rating.new(rating_params.merge(user_id: current_user.id))
      if @rating.save
        redirect_to film_path(@rating.film)
      else
        render :new
      end
    else
      render "/_unauthorized"
    end
  end

  def edit
    @film = Film.find_by(id: params[:film_id])
    if !is_author?
      render "/_unauthorized"
    end
  end

  def update
    if is_author?
      if @rating.update(rating_params)
        redirect_to film_path(@rating.film)
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

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
      @film = @rating.film
      if @rating.save
        if request.xhr?
          render partial: 'rating_partial_show', layout: false, locals: {rating:@rating}
        else
          redirect_to film_path(@rating.film)
        end
      else
        render :new
      end
    else
      render "/_unauthorized"
    end
  end


  def edit
    @film = Film.find_by(id: params[:film_id])
    if !is_author? && !current_user.admin?
      render "/_unauthorized"
    end
  end

  def update
    if is_author? || current_user.admin?
      if @rating.update(rating_params)
        redirect_to film_path(@rating.film)
      else
        binding.pry@
        render :edit
      end
    else
      render "/_unauthorized"
    end
  end

  def destroy
    if is_author? || current_user.admin?
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

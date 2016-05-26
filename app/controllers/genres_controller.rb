class GenresController < ApplicationController

  def index
  	@genres = Genre.all
  end

  def show
  	@genre = Genre.find(params[:id])
  end

  private
  def genre_params
    params.require(:genre).permit(:title, :picture)
  end

end

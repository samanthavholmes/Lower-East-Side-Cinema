class Genre < ActiveRecord::Base


  validates_presence_of :title, :picture

  has_many :films, dependent: :destroy #If a genre is deleted, all movies in that genre will be deleted as well
  has_many :film_ratings, through: :films, source: :ratings


  def sort_by_stars #Sorts all the movies present by star rating and reverses them using the "-"
    self.films.sort_by do |film|
      -film.avg_star_rating #Sorts all the movies present by star rating and reverses them using the "-"
    end
  end

  def film_winner
    self.sort_by_stars.first
  end

  def sort_by_comments #Sorts all the movies present by number of comments and reverses them using the "-"
    self.films.sort_by do |film|
      -film.comment_number
    end
  end

end

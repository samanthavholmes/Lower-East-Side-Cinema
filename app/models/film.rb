class Film < ActiveRecord::Base
  validates_presence_of :title, :description, :director, :picture

  belongs_to :genre
  has_many :ratings

  def avg_star_rating
    (self.ratings.stars.reduce(:+).to_f) / self.ratings.length) #Gives the average number of stars for a given movie
  end

  def comment_number
    self.comments.count #Gives the number of comments for a specific film
  end

  def self.sort_by_stars
    Film.all.sort_by do |film|
      -film.avg_star_rating #Sorts all the movies present by star rating and reverses them using the "-"
    end
  end

  def self.sort_by_comments
    Film.all.sort_by do |film|
      -film.comment_number #Sorts all the movies present by number of comments and reverses them using the "-"
    end
  end

end

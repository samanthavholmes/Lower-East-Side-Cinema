class Genre < ActiveRecord::Base
  validates_presence_of :title, :picture

  has_many :films, dependent: :destroy #If a genre is deleted, all movies in that genre will be deleted as well
  has_many :film_ratings, through: :films, source: :rating
end

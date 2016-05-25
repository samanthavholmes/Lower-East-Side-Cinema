class Genre < ActiveRecord::Base
  validates_presence_of :title, :picture

  has_many :films, dependent: :destroy
  has_many :film_ratings, through: :films, source: :rating
end

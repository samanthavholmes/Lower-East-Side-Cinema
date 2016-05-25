class Film < ActiveRecord::Base
  validates_presence_of :title, :description, :director, :picture

  belongs_to :genre
  has_many :ratings

end

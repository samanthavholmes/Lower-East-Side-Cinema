class Rating < ActiveRecord::Base
  validates_presence_of :stars

  belongs_to :user
  belongs_to :film
  has_many :comments, dependent: :destroy #If a rating is deleted, all comments on it will be deleted as well
end

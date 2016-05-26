class Film < ActiveRecord::Base
  validates_presence_of :title, :description, :director, :picture

  belongs_to :genre
  has_many :ratings

  def avg_star_rating #Gives the average number of stars for a given movie, with judge stars are weighted at 80% and the rest are 20%
    (avg_judge_rating * 0.8 + avg_user_rating * 0.2).round(2)
  end

  def avg_judge_rating #Gives the average number of stars for judges for a given movie
    self.judge_ratings.length != 0 ? self.judge_ratings.sum(:stars) /self.judge_ratings.length : 0
  end

  def avg_user_rating #Gives the average number of stars for the crowd for a given movie
    self.user_ratings.length != 0 ? self.user_ratings.sum(:stars) /self.user_ratings.length : 0
  end

  def judge_ratings
    Rating.joins(:film, :user).where(users: {role: "judge"})
  end

  def user_ratings
    Rating.joins(:film, :user).where(users: {role: "public"})
  end

end

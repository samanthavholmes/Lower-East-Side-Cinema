class Film < ActiveRecord::Base
  validates_presence_of :title, :description, :director, :picture

  belongs_to :genre
  has_many :ratings

  def avg_star_rating #Gives the average number of stars for a given movie, with judge stars are weighted at 80% and the rest are 20%
    avg_judge_rating * 0.8 + avg_user_rating * 0.2
  end

  def avg_judge_rating #Gives the average number of stars for judges for a given movie
    judge_total = 0
    total_judge_ratings = 0
    self.ratings.each do |rating|
        if rating.user.role == "judge"
          total_judge_ratings += 1
          judge_total += rating.stars
        end
      end
    total_judge_ratings != 0 ? judge_total/total_judge_ratings : 0
  end

  def avg_user_rating #Gives the average number of stars for the crowd for a given movie
    user_total = 0
    total_user_ratings = 0
    self.ratings.each do |rating|
      if rating.user.role != "judge"
        total_user_ratings += 1
        user_total += rating.stars
      end
    end
    total_user_ratings != 0 ? user_total/total_user_ratings : 0
  end

end


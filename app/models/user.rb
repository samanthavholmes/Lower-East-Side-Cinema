class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :first_name, :last_name, :email, :role
  validates_uniqueness_of :email
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_length_of :password, within: 6..25, too_long: "must be less than 25 characters", too_short: "must be more than 6 characters"

  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy

  def judge?
    self.role == "judge"
  end

end


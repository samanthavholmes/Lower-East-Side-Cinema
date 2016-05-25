class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :first_name, :last_name, :email, :role
  validates_uniqueness_of :email
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_length_of :password, within: 6..25, too_long: "password must be less than 25 characters", too_short: "password must be more than 6 characters"

  has_many :ratings
  has_many :comments

  def judge?
    self.role == "judge"
  end

end


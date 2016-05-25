module UsersHelper
  def already_rated?(film)
    Rating.find_by(film_id: film.id, user_id: current_user.id)
  end
end

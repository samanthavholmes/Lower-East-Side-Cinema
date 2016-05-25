module SessionsHelper

  def current_user #Sets current_user through the session id
    User.find_by(id: session[:user_id])
  end

  def logged_in? #If there is a current user then the person is logged in
    !!current_user
  end

end

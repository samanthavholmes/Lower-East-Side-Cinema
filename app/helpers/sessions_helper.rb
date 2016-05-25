module SessionsHelper

  def current_user #Sets current_user through the session id
    User.find_by(id: session[:user_id])
  end

  def logged_in? #If there is a current user then the person is logged in
    !!current_user
  end

  def same_user(user) #Checks if the user id of the action is the same as the current user id
    logged_in? && user.id == session[:user_id]
  end

  def require_same_user(user) #Require a person to be logged in and the same user who did the action to do something
  redirect_to root_path unless same_user(user)
  end

end

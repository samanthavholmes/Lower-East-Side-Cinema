class SessionsController < ApplicationController

  def new
    @user = User.new #Instantiate new blank user
  end

  def create
    @user = User.find_by(email: params[:session][:email]) #Create a temp user with strong params
    if @user && @user.authenticate(params[:session][:password]) #If the user exists and the password authenticates
      session[:user_id] = @user.id #give the user a session id
      redirect_to root_path #After logged in, redirect to home page
    else
      @errors = ["Incorrect email or password"]
      render 'new' #If not log in fails, rerender login form
    end
  end

  def destroy
    session.clear #Log the user out, clearing the session
    redirect_to root_path #Bring to home page
  end

end

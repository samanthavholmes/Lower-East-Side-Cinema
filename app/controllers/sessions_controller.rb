class SessionsController < ApplicationController

  def new
    @user = User.new #Instantiate new blank user
  end

  def create
    @user = User.create(login_params) #Create a temp user with strong params
    if @user && @user.authenticate(params[:login][:password]) #If the user exists and the password authenticates
      session[:user_id] = @user.id #give the user a session id
      redirect_to root_path #After logged in, redirect to home page
    else
      render 'new' #If not log in fails, rerender login form
    end
  end

  def destroy
    session.clear #Log the user out, clearing the session
    redirect_to root_path #Bring to home page
  end

private

  def login_params #Strong params white list email and password fields only
    params.require(:login).permit(:email, :password)
  end

end

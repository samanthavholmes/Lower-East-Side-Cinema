class UsersController < ApplicationController


  def new
    @user = User.new #Instantiate new blank user
  end

  def create
    @user = User.new(user_params) #Create a temp user with strong params
    if @user.save # If the user is valid and saves
      redirect_to root_path #redirect to the home page
    else
      @errors = @user.errors.full_messages #Show errors
      render 'create' #Rerender create page
    end
  end

  def show
    @user = User.find_by(id: params[:id]) #Find a user by their id
  end

  def edit
    require_same_user(current_user) #Protects the route against users deleting profiles that aren't theirs


  end

  def update
    require_same_user(current_user)#Protects the route against users deleting profiles that aren't theirs

  end

  def destroy
    @user = User.find_by(id: params[:id]) #Find a user by their id
    @user.destroy #Delete the user from the database
    redirect_to root_path #Redirect to home page
  end

  private

  def user_params #Strong params white listed  fields only
    params.require(:create).permit(:first_name, :last_name, :bio, :picture, :email, :password)
  end

end

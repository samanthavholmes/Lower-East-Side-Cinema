class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new #Instantiate new blank user
  end

  def create
    @user = User.new(user_params) #Create a temp user with strong params
    if @user.save # If the user is valid and saves
      session[:user_id] = @user.id
      redirect_to root_path #redirect to the home page
    else
      @errors = @user.errors.full_messages #Show errors
      render 'new' #Rerender register page
    end
  end

  def show
  end

  def edit #Render edit page
    if !is_user? #Protects the route against users deleting profiles that aren't theirs
      render "_unauthorized"
    end
  end

  def update
    if is_user? #Protects the route against users deleting profiles that aren't theirs
      @user = current_user.assign_attributes(user_params)
      if @user.save
        redirect_to root_path #Redirect to home page
      else
        @errors = @user.errors.full_messages #Show error messages
        render 'edit' #Rerender edit page
      end
    else
      render "_unauthorized"
    end
  end

  def destroy
    if is_user?
      @user.destroy #Delete the user from the database
      redirect_to root_path #Redirect to home page
    else
      render "_unauthorized"
    end
  end

  private

  def user_params #Strong params white listed fields only
    params.require(:user).permit(:first_name, :last_name, :bio, :picture, :email, :password)
  end

  def set_user # Sets the user for further controller methods
    @user = User.find_by(id: params[:id])
  end

  def is_user?
    @user == current_user
  end

end

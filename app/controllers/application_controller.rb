class ApplicationController < ActionController::Base
  include SessionsHelper #Gives all controllers access to the helper methods within the sessions helper module
  protect_from_forgery with: :exception #Protection from CSRF attacks
  
end

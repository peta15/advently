class SessionsController < ApplicationController

  def new
    @title = "Sign in"
  end
    
  def create
    #raise request.env["omniauth.auth"].to_yaml   # prints fb response (for debugging)
    auth = request.env["omniauth.auth"]        
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    #redirect_to root_url, :notice => "Signed in!"
    redirect_back_or user
    flash[:notice] = "Signed in!"
  end
  
end

class SessionsController < ApplicationController

  def create
    # binding.pry
    @user = User.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) || User.create_with_omniauth(auth_hash)
    session[:current_user] = @user
    session[:user_id] = @user.id
    redirect_to questions_path # root_url #, :notice => "Logged in!"
  
  end

  # def new 
  #   session[:return_to] = request.referer
  # end

  def destroy
    session[:user_id] = nil
    redirect_to root_url #, :notice => "Signed out!"
  end

  protected

    def auth_hash
      request.env['omniauth.auth'] # || request.referrer || root_path
    end

end

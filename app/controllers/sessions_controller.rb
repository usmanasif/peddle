class SessionsController < ApplicationController
  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      remember_me!
      if user.role.blank?
        return redirect_to home_user_info_page_path
      else
        redirect_back_or_to root_url, :notice => "Logged in!"
      end
    else
      flash.now.alert = "Email or password was invalid"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => "Logged out!"
  end
end

class OauthsController < ApplicationController
  skip_before_filter :require_login

  # sends the user on a trip to the provider,
  # and after authorizing there back to the callback url.
  def oauth
    login_at(params[:provider])
  end

  def callback



    provider = params[:provider]
    @user = login_from(provider)
    if @user
      remember_me!
      if @user.role.blank?
        redirect_to home_user_info_page_path
      else
        redirect_to root_path, :notice => "Logged in from #{provider.titleize}!"
      end

    else
      begin
        @user = create_from(provider)
        # NOTE: this is the place to add '@user.activate!' if you are using user_activation submodule
        reset_session # protect from session fixation attack
        auto_login(@user)
        remember_me!
        if @user.role.blank?
          redirect_to home_user_info_page_path
        else
          redirect_to root_path, :notice => "Logged in from #{provider.titleize}!"
        end

      rescue
        redirect_to root_path, :alert => "Failed to login from #{provider.titleize}!"
      end
    end
  end
end

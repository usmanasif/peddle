class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:update]

  def new
    @user = User.new


  end

  def create

    @user = User.new(params[:user])
    if @user.save
      if @user.role.blank?
        auto_login(@user)
        remember_me!
        return redirect_to home_user_info_page_path
      else
        redirect_back_or_to root_url, :notice => "Logged in!"
      end

      redirect_to root_url, :notice => "Signed up!"
    else
      render :new
    end
  end


    def update

      @user = User.find(params[:id])

       if @user.update_attributes(params[:user])
         redirect_to root_path, :notice => 'User was successfully updated.'
       else
        @accounts = Account.all
        render "home/user_info_page"

       end





      #@user.update_attributes(params[:user])
      #@profile = Profile.new(params[:user][:profile_attributes])
      #@profile.save


    end


end

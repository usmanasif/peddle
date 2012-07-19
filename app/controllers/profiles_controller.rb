class ProfilesController < ApplicationController
  def new
  end

  def create

    @profile = Profile.new(params[:profile])
     @profile.save
  end
end

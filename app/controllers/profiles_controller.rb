class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
  end
  
  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    profile = Profile.find(params[:id])
    profile.update(message: params[:profile][:message])
    redirect_to profile_path(profile.id)
  end
end

class VkUserController < ApplicationController
  def auth
    user_data = params[:user]
    user = VkUser.find_or_create_by(:uid => user_data['uid'])
    user.update_attributes(user_data)
    user.save!
    session[:user] = user._id
    respond_to do |format|
      format.html { render :status => 200, :text => '' }
    end
  end
end

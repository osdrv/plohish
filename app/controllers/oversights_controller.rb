class OversightsController < ApplicationController
  # POST /oversights
  def create
    @user = VkUser.find(session[:user])
    if !@user.nil?
      @oversight = Oversight.new(params[:oversight])
      @oversight.save
      @user.oversights << @oversight
    end
    respond_to do |format|
      format.html { redirect_to('/') }
    end
  end

  def mark
    @user = VkUser.find(session[:user])
    @oversight = Oversight.find(params[:id])
    if !@user.nil? && !@oversight.nil? && !@oversight.is_marked_by?(@user) 
      mark = params[:mark] == 'dislike'? -1 : 1
      @oversight.place_mark(@user, mark)
    end
    respond_to do |format|
      format.html { redirect_to('/') }
    end
  end

  def mee_too
    @user = VkUser.find(session[:user])
    @oversight = Oversight.find(params[:id])
    if !@user.nil? && !@oversight.nil? && !@oversight.duplicated_by_user?(@user)
      mee_too = MeeToo.create()
      @oversight.mee_toos << mee_too
      @user.mee_toos << mee_too
    end
    respond_to do |format|
      format.html { redirect_to('/') }
    end
  end
end

class TitleController < ApplicationController
  def index
    @oversights = Oversight.last(30)
    @form = Oversight.new
    @user = VkUser.find(session[:user]) if !session[:user].nil?
  end
end

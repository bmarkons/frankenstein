class HomeController < ApplicationController
  def index
    if current_user.nil?
      @top_10 = Accommodation.top10
      render :welcome if current_user.nil?
    end
  end
end

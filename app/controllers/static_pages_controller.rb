class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @featured_user = current_user
    else
      @featured_user = User.joins(:projects).includes(:projects).order("RAND()").first
    end
  end
end

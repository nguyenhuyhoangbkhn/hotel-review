class Admin::ReviewsController < ApplicationController

  def update
    review = Review.where(hotel_id: params[:id], admin_user_id: current_admin_user.id)
      .first.update rating: params[:review][:rating]
    redirect_to :back
  end
end

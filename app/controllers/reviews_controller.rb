class ReviewsController < ApplicationController

  def edit
  end

  def create
    @review = Review.create rating: params[:review][:rating], hotel_id:  params[:review][:hotel_id],
      user_id: current_user.id
    redirect_to hotel_path(@review.hotel)
  end

  def update
    @review = Review.where(hotel_id: params[:review][:hotel_id], user_id: current_user.id).first
    @review.update rating: params[:review][:rating]
    redirect_to hotel_path(@review.hotel)
  end

  private
  def review_params
    params.require(:review).permit(:rating)
  end
end

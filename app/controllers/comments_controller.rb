class CommentsController < ApplicationController
  # before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def create
    @hotel = Hotel.find_by id: params[:hotel_id]
    @comment = @hotel.comments.build(comment_params)
    @comment.user_id = current_user.id

  if @comment.save
      redirect_to hotel_path(@hotel)
  else
    flash[:warning]= "You can not comment on this post"
    redirect_to hotel_path(@hotel)
  end
  end

  def destroy
    @hotel = Hotel.find_by id: params[:hotel_id]
    @comment = @hotel.comments.find_by id: params[:id]
    @comment.destroy
    flash[:success] = 'Comment deleted.'
    redirect_to :back
  end

  def update
    @comment = Comment.find_by id: params[:id]
    if @comment.update_attributes comment_params
      flash[:success] = "Edit Comment success"
    else
      flash[:danger] = "Edit Comment unsuccess"
    end
    redirect_to hotel_path(@comment.hotel)
  end

  private
  def comment_params
    params.require(:comment).permit( :content, :picture)
  end
end

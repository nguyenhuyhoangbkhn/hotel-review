class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  def show
  end

  def edit
    unless current_user == @user
      redirect_to :back
    end
    @user.build_avatar unless @user.avatar.present?
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'user was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = AdminUser.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit :name, :address, :tel, :bio, :birthday, :job, :edu, :email,
      :password, :password_confirmation,
      avatar_attributes: [:id, :picture, :_destroy]
  end

  def set_user
    @user = User.find params[:id]
  end
end

class Admin::UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]
  layout "admin"
  before_action :authenticate_admin_user!

  def index
    @users = User.page(params[:page]).per params[:per_page]
  end

  def show
  end

  def new
    @user = User.new
    @user.build_avatar
  end

  def edit
    @user.build_avatar unless @user.avatar.present?
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to [:admin, @user], notice: 'user was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to [:admin, @user], notice: 'user was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if (current_user == @user) || current_user.admin?
      @user.destroy
      redirect_to users_url
    else
      redirect_to :back
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit :name, :address, :tel, :bio, :birthday, :job, :edu, :email,
      :password, :password_confirmation,
      avatar_attributes: [:id, :picture, :_destroy]
  end
end

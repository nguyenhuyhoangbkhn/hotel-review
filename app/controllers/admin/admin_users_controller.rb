class Admin::AdminUsersController < ApplicationController
  before_action :set_admin_user, only: [:show, :edit, :update, :destroy]
  layout "admin"
  before_action :authenticate_admin_user!

  def index
    @admin_users = AdminUser.page(params[:page]).per params[:per_page]
  end

  def show
  end

  def new
    @admin_user = AdminUser.new
    @admin_user.build_avatar
  end

  def edit
    unless (current_admin_user == @admin_user) || current_admin_user.admin?
      redirect_to :back
    end
    @admin_user.build_avatar unless @admin_user.avatar.present?
  end

  def create
    @admin_user = AdminUser.new(admin_user_params)
    @admin_user.role = 0
    respond_to do |format|
      if @admin_user.save
        format.html { redirect_to [:admin, @admin_user], notice: 'admin_user was successfully created.' }
        format.json { render :show, status: :created, location: @admin_user }
      else
        format.html { render :new }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin_user.update(admin_user_params)
        format.html { redirect_to [:admin, @admin_user], notice: 'admin_user was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_user }
      else
        format.html { render :edit }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if (current_admin_user == @admin_user) || current_admin_user.admin?
      @admin_user.destroy
      redirect_to admin_admin_users_url
    else
      redirect_to :back
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin_user
    @admin_user = AdminUser.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_user_params
    params.require(:admin_user).permit :name, :address, :tel, :bio, :birthday, :job, :edu, :email,
      :password, :password_confirmation, :role,
      avatar_attributes: [:id, :picture, :_destroy]
  end
end

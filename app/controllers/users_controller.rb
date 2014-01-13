# encoding: utf-8

class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(update_user_params)
      flash[:success] = "用户信息已更新"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "欢迎来到微博!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "用户已删除"
    redirect_to users_url
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def update_user_params
    params.require(:user).permit(:name, :password,
                                 :password_confirmation)
  end

  # Before filters



  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
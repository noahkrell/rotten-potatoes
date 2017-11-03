
class UsersController < ApplicationController
  include SessionsHelper

  before_action :require_login, only: [:edit, :update]

  def show
    @user = User.find_by(id: params[:id])
    redirect_to root_url if current_user.nil?
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
    redirect_to login_path unless current_user == @user
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_url
  end


private
  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_path # halts request cycle
    end
  end

end

class UsersController < ApplicationController
  def new
    @user = User.new
    @user.build_license
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "User Successfully Created"

      redirect_to users_url
    else
      render 'new'
    end
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, license_attributes:[:number, :state])
  end

end

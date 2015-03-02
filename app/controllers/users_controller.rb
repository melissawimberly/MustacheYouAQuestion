class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_or_create_by(user_params)
  end

  def show
    @user = User.find_by(id: params[:id])
    # @user.question.id
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update

  end

  def destroy
  end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end

class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @words = Word.includes(:user).order(created_at: :desc).page(params[:page]).per(10)
    # binding.pry
  end

  def edit
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :self_introduction)
end
end

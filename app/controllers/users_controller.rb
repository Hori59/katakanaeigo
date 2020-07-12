class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def show
    @user = User.find(params[:id].to_s)
    @words = Word.includes(:user).where(id: @user.id).order(created_at: :desc).page(params[:page]).per(10)
    if @words.empty?
      @message = "投稿はありません"
    end
    # binding.pry
  end

  def user_params
    params.require(:user).permit(:id, :name, :profile_image, :self_introduction)
  end
end

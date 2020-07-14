class UsersController < ApplicationController

  def show
    @user = User.find(params[:id].to_s)
    if @user == current_user # user本人だった場合投稿を全て取得
      @words = Word.includes(:user).where(user_id: @user.id).order(created_at: :desc).page(params[:page]).per(10)
      if @words.empty?
        @message = "投稿はありません"
      end
    else # user本人でない場合は公開中の投稿のみ取得
      @words = Word.includes(:user).where(user_id: @user.id, is_published: true).order(created_at: :desc).page(params[:page]).per(10)
      if @words.empty?
        @message = "投稿はありません"
      end
    end
  end

  def user_params
    params.require(:user).permit(:id, :name, :profile_image, :self_introduction)
  end

  # ユーザ本人以外のアクセスを禁止
  def correct_user
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to root_path
    end
  end
end

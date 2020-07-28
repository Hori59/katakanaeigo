class UsersController < ApplicationController

  def show
    @user = User.find(params[:id].to_s)
    @no_words = "- お気に入りはありません -" if @user.favorite_words.empty?
    if @user == current_user # user本人だった場合投稿を全て取得
      @words = Word.includes(:user).where(user_id: @user.id).order(created_at: :desc).page(params[:page]).per(10)
      if @words.empty?
        @message = "- 投稿はありません -"
      end
    else # user本人でない場合は公開中の投稿のみ取得
      @words = Word.includes(:user).where(user_id: @user.id, is_published: true).order(created_at: :desc).page(params[:page]).per(10)
      if @words.empty?
        @message = "- 投稿はありません -"
      end
    end
  end

  # 退会ユーザ復帰機能後回し
  # def user_restore
  #   @user = User.only_deleted.find(params[:id]).restore
  #   session[:id] = @user.id
  #   flash[:notice] = "退会を取り消しました"
  #   redirect_to user_path(@user)
  # end

  private

  def user_params
    params.require(:user).permit(:id, :name, :profile_image, :self_introduction)
  end
end

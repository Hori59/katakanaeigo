class WordsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # 投稿一覧 全ワードのうち公開中のもののみ取得
  def index
    @words = Word.includes(:user).where(is_published: true).order(created_at: :desc).page(params[:page]).per(10)
  end

  # 新規投稿画面表示
  def new
    @word = Word.new
    @title = "投稿"
  end

  # 新規投稿
  def create
    @user = current_user
    @word = Word.new(word_params)
    @word.user_id = @user.id
    if params[:public] # 保存ボタンが押された場合公開フラグをtrueで保存
      @word.is_published = true
      if @word.save
        redirect_to word_path(@word)
      else
        render :new
      end
    elsif params[:draft]# 下書きボタンが押された場合公開フラグをfalseで保存
      @word.is_published = false
      if @word.save
        redirect_to word_path(@word)
      else
        render :new
      end
    end
  end

  # 投稿詳細表示
  def show
    @word = Word.find(params[:id])
    @comment = Comment.new
    # binding.pry
  end

  # 投稿編集画面表示
  def edit
    @word = Word.find(params[:id])
    if @word.is_published == false
      @title = "下書き"
    else
      @title = "編集"
    end
  end

  # 投稿上書き
  def update
    @word = Word.find(params[:id])
    if params[:public] # 保存ボタンが押された場合公開フラグをtrueで保存
      @word.is_published = true
      if @word.update(word_params)
        redirect_to word_path(@word)
      else
        render :edit
      end
    elsif params[:draft]# 下書きボタンが押された場合公開フラグをfalseで保存
      @word.is_published = false
      if @word.update(word_params)
        redirect_to root_path
      else
        render :edit
      end
    end
  end

  # 投稿削除
  def destroy
    @word = Word.find(params[:id])
    @word.destroy
    redirect_to user_path(current_user)
  end

  private

  # 投稿のストロングパラメータを設定
  def word_params
    params.require(:word).permit(:user_id, :name, :english_name, :description, :is_published)
  end

  #投稿者本人以外のアクセスを禁止
  def correct_user
    @word = Word.find(params[:id])
    unless @word.user_id == current_user.id
      flash[:message] = "アクセス権がありません"
      redirect_to root_path
    end
  end
end
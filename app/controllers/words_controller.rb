class WordsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @words = Word.includes(:user).where(is_published: true).order(created_at: :desc).page(params[:page]).per(10)
  end

  def new
    @word = Word.new
    @title = "投稿"
  end

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

  def show
    @word = Word.find(params[:id])
  end

  def edit
    @word = Word.find(params[:id])
    if @word.is_published == false
      @title = "下書き"
    else
      @title = "編集"
    end
  end

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
end
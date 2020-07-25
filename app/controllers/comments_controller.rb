class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]

  def create
    @word = Word.find(params[:word_id])
    @comment = current_user.comments.new(comment_params)
    @comment.word_id = @word.id
    if @comment.save
      redirect_to word_path(@word)
    else
      @tags = Tag.order(:id).limit(10).offset(0)
      @all_ranks = Word.find(Favorite.group(:word_id).order('count(word_id) desc').limit(10).pluck(:word_id))
      render "words/show"
    end
  end

  def edit
    @word = Word.find(params[:word_id])
    @comment = Comment.find_by(word_id: @word.id, id: params[:id])
  end

  def update
    @word = Word.find(params[:word_id])
    @comment = Comment.find_by(word_id: @word.id, id: params[:id])
    if @comment.update(comment_params)
      redirect_to word_path(@comment.word_id)
    else
      render :edit
    end
  end

  def destroy
    comment = Comment.find_by(word_id: params[:word_id], id: params[:id])
    comment.destroy
    redirect_to word_path(params[:word_id])
  end

  private

  # コメント機能のストロングパラメータ
  def comment_params
    params.require(:comment).permit(:body)
  end

  #投稿者本人以外のアクセスを禁止
  def correct_user
    @comment = Comment.find_by(word_id: params[:word_id], id: params[:id])
    unless @comment.user_id == current_user.id
      flash[:message] = "アクセス権がありません"
      redirect_to word_path(params[:word_id])
    end
  end
end

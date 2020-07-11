class WordsController < ApplicationController
  def index
    @words = Word.includes(:user).order(created_at: :desc).page(params[:page]).per(10)
  end
end

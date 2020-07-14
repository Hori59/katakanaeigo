class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    word = Word.find(params[:word_id])
    favorite = current_user.favorites.new(word_id: word.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    word = Word.find(params[:word_id])
    favorite = current_user.favorites.find_by(word_id: word.id)
    favorite.destroy
    redirect_to request.referer
  end
end

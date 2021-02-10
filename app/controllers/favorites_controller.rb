class FavoritesController < ApplicationController
  def create
      @book = Book.find(params[:book_id])
      favorite = current_user.favorites.new(book_id: @book.id)
      favorite.save
      user = current_user
      ThanksMailer.(user).deliver
  end
  
  def destroy
      @book = Book.find(params[:book_id])
      favorite = current_user.favorites.find_by(book_id: @book.id)
      favorite.destroy
  end
end

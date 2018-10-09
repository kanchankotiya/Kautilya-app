class EBooksController < ApplicationController
  def index
    @categories = Category.all
    @e_books = EBook.all
    @user = current_user
  end

  def show
    @e_book = EBook.find(params[:id])
    @categories = Category.all
  end



  
end

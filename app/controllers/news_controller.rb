class NewsController < ApplicationController
  def show
    @news = News.find(params[:id])
    @categories = Category.all
  end
end
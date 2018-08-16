class NewsController < ApplicationController
  def show
    @news = News.find(params[:id])
    @category = Category.find(params[:id])
  end
end

class NewsController < ApplicationController
  def show
    @news = News.find(params[:id])
    @categories = Category.all.order("id").limit(1)
  end
end
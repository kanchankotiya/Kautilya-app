class HomeController < ApplicationController
  def index
    @news = News.all
    @categories = Category.all
  end
end

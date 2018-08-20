class NewsController < ApplicationController
  before_action :set_news, only: [:show]
  # before_action :set_category, only: [:show]
  def index
    @category = Category.all
    @news = @category.news.all
  end

  def show
    @news = News.find(params[:id])
    @categories = Category.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end


    # def set_category
    #   @category = Category.find(params[:category_id])
    # end
end
class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @categories = Category.all
    @news_pag = News.page(params[:page]).per(10)
    @news_by_month = News.all.map { |news| [Date::MONTHNAMES[news.created_at.month], news.created_at.year].join(' ') }
    .each_with_object(Hash.new(0)) { |month_year, counts| counts[month_year] += 1 }
  end
end

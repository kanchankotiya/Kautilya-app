class NewsController < ApplicationController
  def show
    @news = News.find(params[:id])
    @news_count = News.all
    @categories = Category.all
    @news_count_created_at = News.all.map { |news| [Date::MONTHNAMES[news.created_at.month], news.created_at.year].join(' ') }
    .each_with_object(Hash.new(0)) { |month_year, counts| counts[month_year] += 1 }
  end
end
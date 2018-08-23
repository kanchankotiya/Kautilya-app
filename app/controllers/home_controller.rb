class HomeController < ApplicationController
  def index
    @news = News.all
    @news_paginate = News.page(params[:page]).per(10)
    @categories = Category.all
    @news_count = News.all.map { |news| [Date::MONTHNAMES[news.created_at.month], news.created_at.year].join(' ') }
    .each_with_object(Hash.new(0)) { |month_year, counts| counts[month_year] += 1 }
  end
end

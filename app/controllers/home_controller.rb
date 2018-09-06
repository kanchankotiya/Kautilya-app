class HomeController < ApplicationController
  def index
    @news = News.all
    @news_paginate = News.page(params[:page]).per(10)
    @categories = Category.all
    @user = current_user
    @videos = Video.all
    @search = News.ransack(params[:q])
    @news = @search.result
    @news_by_month = News.all.map { |news| [Date::MONTHNAMES[news.created_at.month], news.created_at.year].join(' ') }
    .each_with_object(Hash.new(0)) { |month_year, counts| counts[month_year] += 1 }
  end

  def news_by_month
    @categories = Category.all
    @news = News.all
    @news_paginate = News.page(params[:page]).per(10)
    @news_by_month = News.all.map { |news| [Date::MONTHNAMES[news.created_at.month], news.created_at.year].join(' ') }
    .each_with_object(Hash.new(0)) { |month_year, counts| counts[month_year] += 1 }
    if params[:month]
      date = Date.parse("1 #{params[:month]}")  # to get the first day of the month
      @news = @news.where(:created_at => date..date.end_of_month)  # get posts for the month
    else
      @news = News.all
    end
  end

end

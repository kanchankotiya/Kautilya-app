class HomeController < ApplicationController
  def index
    @news = News.all
    @news_paginate = News.page(params[:page]).per(10)
    @categories = Category.all
    @news_count = News.all.map { |news| [Date::MONTHNAMES[news.created_at.month], news.created_at.year].join(' ') }
    .each_with_object(Hash.new(0)) { |month_year, counts| counts[month_year] += 1 }
  end

  def news_by_date
    @categories = Category.all
    @news = News.all
    @news_paginate = News.page(params[:page]).per(10)
     @news_count = News.all.map { |news| [Date::MONTHNAMES[news.created_at.month], news.created_at.year].join(' ') }
    .each_with_object(Hash.new(0)) { |month_year, counts| counts[month_year] += 1 }
    @news_by_date = @news.group_by{ |t| t.created_at.to_date == DateTime.now.to_date }
    if @news_by_date[false].present?
      #Create month wise groups of messages      
      @month_wise_sorted_alerts  = @news_by_date[false].group_by{ |t| t.created_at.month }
      @news_date = News.all.order("extract(month from created_at) DESC")
    end    
  end

end

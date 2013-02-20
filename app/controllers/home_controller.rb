class HomeController < ApplicationController
  def index
    @news = News.all
  end

  def impressum

  end
end

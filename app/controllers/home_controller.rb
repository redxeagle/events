class HomeController < ApplicationController
  def index
    @news = News.all(:order => 'id DESC')
  end

  def impressum

  end
end

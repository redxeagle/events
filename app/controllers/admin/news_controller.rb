class Admin::NewsController < ApplicationController
  access_control do
         allow :admin
   end
  def new
     @news = News.new
   end

   def create
      @news= News.new(params[:news])
      @news.user = current_user
      if @news.save
        flash[:notice] = "News angelegt!"
        redirect_back_or_default root_url
      else
        render :action => :new
      end
    end

   def show
   end

   def edit
     @news = News.find_by_id(params[:id])
   end

  def update
    @news = News.find(params[:id])
    if @news.update_attributes(params[:news])
      flash[:notice] = "News updated!"
      redirect_to root_url
    else
      render :action => :edit
    end
  end

end

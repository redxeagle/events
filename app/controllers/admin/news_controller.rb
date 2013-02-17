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
   end

end

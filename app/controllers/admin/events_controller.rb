class Admin::EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
     @event = Event.new(params[:event])
     if @event.save
       flash[:notice] = "Event angelegt!"
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
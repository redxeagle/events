class Admin::EventsController < ApplicationController
  access_control do
        allow :admin
  end

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
    @events = Event.all
  end

  def edit

  end

  def index
    @events = Event.all
  end

end

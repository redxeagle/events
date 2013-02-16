class ParticipantsController < ApplicationController
  before_filter :require_user, :only => [:new, :create, :show]
  def show
  end

  def edit
  end

  def create
    @participant = Participant.new(params[:participant])
    @participant.user = current_user
    if @participant.save
      flash[:notice] = "angemeldet!"
      redirect_back_or_default root_url
    else
      render :action => :new
    end
  end

  def new
    @participant = Participant.new
    @events = Event.where(:registration => true)
  end

end

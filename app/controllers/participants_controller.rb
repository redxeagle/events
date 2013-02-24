class ParticipantsController < ApplicationController
  before_filter :require_user, :only => [:new, :create, :show]

  def show
    csv_string = Participant.to_csv
    respond_to do |format|
      format.html
      format.csv {
        send_data csv_string,
          :type => 'text/csv; charset=iso-8859-1; header=present',
          :disposition => "attachment; filename=participant.csv"
      }
    end
  end

  def edit
  end

  def create
    @participant = Participant.new(params[:participant])
    @participant.user = current_user
    @user = current_user
    @events = Event.where(:registration => true)
    if @participant.save
      flash[:notice] = "angemeldet!"
      redirect_back_or_default new_participant_path
    else
      render :action => :new
    end
  end

  def new
    @participant = Participant.new
    @user = current_user
    now = Time.now.utc + 1.hour
    @events = Event.where(:registration => true).
                    where("registration_start <= ? AND  registration_end >= ?", now, now)
    @events = @events.select { |event| event.participants.count < event.maximum_participant}

  end

  def index
  end

  def destroy
    participant = Participant.find(params[:id])
    participant.destroy
    flash[:notice] = "Abmeldung war erfolgreich"
    redirect_back_or_default new_participant_path
  end

end

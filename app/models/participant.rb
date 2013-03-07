require 'faster_csv'

class Participant < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  validates_uniqueness_of :user_id, :scope => [:event_id, :self_registration], :if => Proc.new {|participant| participant.self_registration? == true}, :message => "Sie sind bereits für dieses Event angemeldet"
  validates :first_name, :second_name, :city, :birthday, :presence => true, :if => Proc.new {|participant| !participant.self_registration? }
  validate :maximum_participants_not_reached

  def maximum_participants_not_reached
    if event.participants.count >= event.maximum_participant
      errors.add("Maximale", " Teilnehmer erreicht.")
    end
  end

  def csv_line
    if(self.self_registration?)
      return [self.id.to_s,
              self.user.second_name,
              self.user.first_name,
              self.user.city,
              (self.user.male? ? "männlich" : "weiblich"),
              calculate_age(self.user.birthday).to_s,
              self.power?.to_s  ]
    else
      return [self.id.to_s,
              self.second_name,
              self.first_name,
              self.city,
              (self.male? ? "männlich" : "weiblich"),
              calculate_age(self.birthday).to_s,
              self.power?.to_s]
    end
  end

  def self.to_csv
    @participants = Participant.all
    csv_string = FasterCSV.generate do |csv|
      @participants.each do |participant|
        csv << participant.csv_line
      end
    end
    return csv_string

    var string = FasterCSV.generate do |csv|
      self.all.each do |participant|
            csv << participant.csv_line
      end
    end
  end

  def calculate_age(birthday)
    now = Time.now.utc.to_date
    now.year - birthday.year - (birthday.to_date.change(:year => now.year) > now ? 1 : 0)
  end
end

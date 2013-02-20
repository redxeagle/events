require 'faster_csv'

class Participant < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  validates_uniqueness_of :user_id, :scope => :event_id, :if => Proc.new {|participant| participant.self_registration == 1}, :message => "Sie sind bereits für dieses Event angemeldet"

  def csv_line
    return [self.id.to_s,
            self.user.second_name,
            self.user.first_name,
            self.user.city,
            (self.user.male? ? "männlich" : "weiblich"),
            calculate_age(self.user.birthday).to_s,
            self.power?.to_s  ]
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

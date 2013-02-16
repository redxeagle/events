class Event < ActiveRecord::Base
  has_one :hall
  has_many :participants
end

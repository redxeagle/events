class Event < ActiveRecord::Base
  belongs_to :hall
  has_many :participants
  has_many :assets
end

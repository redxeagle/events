class Asset < ActiveRecord::Base
  validates :filename, :uniqueness => true
  validates :description, :file_text, :event_id, :presence => true
  attr_accessor :file
end

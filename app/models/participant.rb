class Participant < ActiveRecord::Base
  has_one :user
end

class User < ActiveRecord::Base
  has_many :participants

  validates :email, :uniqueness => true
  validates :first_name, :second_name, :city, :birthday, :male, :presence => true

  acts_as_authentic do |c|
    #c.my_config_option = my_value # for available options see documentation in: Authlogic::ActsAsAuthentic
  end # block optional

  def activate!
     self.active = true
     save
  end
end
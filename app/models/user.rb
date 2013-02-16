class User < ActiveRecord::Base
    acts_as_authorization_subject  :association_name => :roles, :join_table_name => 'roles_users'
  has_many :participants

  validates :email, :uniqueness => true
  validates :first_name, :second_name, :city, :birthday, :presence => true

  acts_as_authentic do |c|
    #c.my_config_option = my_value # for available options see documentation in: Authlogic::ActsAsAuthentic
  end # block optional

  def activate!
     self.active = true
     save
  end
end



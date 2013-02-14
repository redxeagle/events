class UserMailer < ActionMailer::Base
  default :from => "ostblockcup@googlemail.com"

  def activation_email(user, password)
    @user = user
    @url = "http://#{APP_CONFIG['hostname']}/user_session/new"
    @password = password
    @activation_code = user.persistence_token
    mail(:to => user.email, :subject => "Aktivierungs E-Mail")
  end

  def welcome_email(user)
      @user = user
      @url  = "http://example.com/login"
      mail(:to => user.email, :subject => "Welcome to My Awesome Site")
    end
end

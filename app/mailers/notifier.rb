class Notifier < ActionMailer::Base
  
  from_address = ActionMailer::Base.smtp_settings[:user_name]
  default from: "Ticketee App "
  
  def user_created(user)
    @user = user
    subject = " Welcome #{user.name} !"
    mail(:to => user.email, :subject => subject)
  end

end

class User < ActiveRecord::Base
  
  has_secure_password
  after_save :send_welcome_email

  def send_welcome_email
    Notifier.user_created(self).deliver
  end

end

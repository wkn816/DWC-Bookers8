class UserMailer < ApplicationMailer
  def thanks(user)
    @user = user
    mail to: @user.email, subject: 'Welcome to Our Application!'
  end

  def daily(user)
    @user = user

    mail to: @user.email, subject: 'Daily mail'    
  end
end

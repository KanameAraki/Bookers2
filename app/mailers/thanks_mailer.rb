class ThanksMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    mail to: @user.email, subject:"登録ありがとうございます"
  end

end

class ThanksMailer < ApplicationMailer
  def thanks_email(u)
    
    mail to: @user.email, subject: '会員登録が完了しました'
  end
end

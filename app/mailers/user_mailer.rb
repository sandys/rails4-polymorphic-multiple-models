class UserMailer < ActionMailer::Base
  default from: "no-reply@redcarpetmails.com"

  def test(email)
    mail(:to => email, :subject => "Test mail from Redcarpet")
  end

  # this method sends mail once the registration succeeds
  def welcome_mail(user)
     mail(:to => user.email, :subject => "Thank you so much for registering")
  end

  #
  def update_password_email(user)
     mail(:to => user.email, :subject => "Your Password updated successfully")
  end
end

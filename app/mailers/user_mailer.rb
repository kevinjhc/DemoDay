class UserMailer < ActionMailer::Base
  default from: "\"TechStars Demo Day\" <demoday-noreply@sendgrid.me>"

  def contact_confirmation(startup, user)
    @startup = startup
    @user = user

    mail(:to => user.email, :reply_to => "\"#{startup.ceo_name}\" <#{startup.email}>", :subject => "Confirmation: Request sent to #{startup.name}")
  end

  def startup_email(startup, user)
    @startup = startup
    @user = user

    mail(:to => startup.email, :reply_to => "\"#{user.name}\" <#{user.email}>", :subject => "#{user.name} wants to connect")
  end

end
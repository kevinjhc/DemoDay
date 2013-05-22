class EmailContactsController < ApplicationController
  def create
    @startup = Startup.find(params[:id])
    startup = params[:startup_id].to_i

    email_confirmation
    notify_startup

    current_user.email_contacts.create({ startup_id: startup, user_id: current_user.id })
    
  end

  def email_confirmation
    UserMailer.contact_confirmation(@startup, current_user).deliver
  end

  def notify_startup
    UserMailer.startup_email(@startup, current_user).deliver
  end

end

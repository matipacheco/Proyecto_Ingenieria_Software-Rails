class MailingController < ApplicationController
  def mail_to
    if    params[:mail][:notification_type_id].to_i == 1
      list = Notification.musicos
    elsif params[:mail][:notification_type_id].to_i == 2
      list = Notification.musicologos
    elsif params[:mail][:notification_type_id].to_i == 3
      list = Notification.melomanos
    else
      redirect_to lists_url
    end

    subject = params[:mail][:subject]
    body    = params[:mail][:body]
    list.each {|notification| MailingList.send_to(notification.user_id, subject, body)}
    
    redirect_to lists_url
  end
end
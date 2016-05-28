class NotificationsController < ApplicationController
  def update
    user_id = params[:notification][:user_id].to_i
    
    n1 = Notification.by_user_and_type([user_id,1])
    n2 = Notification.by_user_and_type([user_id,2])
    n3 = Notification.by_user_and_type([user_id,3])

    if n1.none? and params[:notification][:musico].to_i == 1
      n = Notification.create()
      n.update_attribute(:user_id, user_id)
      n.update_attribute(:notification_type_id, 1)
    elsif n1.any? and params[:notification][:n1].present? and params[:notification][:musico].to_i == 0
      n1.first.destroy
    end

    if n2.none? and params[:notification][:musicologo].to_i == 1
      n = Notification.create()
      n.update_attribute(:user_id, user_id)
      n.update_attribute(:notification_type_id, 2)
    elsif n2.any? and params[:notification][:n2].present? and params[:notification][:musicologo].to_i == 0
      n2.first.destroy
    end

    if n3.none? and params[:notification][:melomano].to_i == 1
      n = Notification.create()
      n.update_attribute(:user_id, user_id)
      n.update_attribute(:notification_type_id, 3)
    elsif n3.any? and params[:notification][:n3].present? and params[:notification][:melomano].to_i == 0
      n3.first.destroy
    end 

    redirect_to me_url 
  end

  def watch_lists    
  end

  def send_mail
  end

  def remove_form_list
    Notification.find(params[:m][:id].to_i).destroy
    redirect_to lists_url
  end
end
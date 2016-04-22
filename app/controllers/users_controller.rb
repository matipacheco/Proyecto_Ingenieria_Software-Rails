class UsersController < ApplicationController
  def new
    @user =  User.create(email: params[:user][:email], 
                        name: params[:user][:name], 
                        surname: params[:user][:surname], 
                        group_id: 4)
    @user.update_attribute(:password, params[:user][:password])
    log_in @user
    redirect_to root_url
  end

  def register
  end

  def me
  end

  def update
    user      = User.find params[:user_data][:user_id].to_i
    password  = params[:user_data][:password]

    unless password.nil?
      user.update_attribute(:password, password)
    end

    redirect_to root_url
  end

  def create_editor
    old_editor = User.find_by(group_id: 2)
    old_editor.destroy

    editor = User.create(email: params[:editor][:email], 
                          name: params[:editor][:name], 
                          surname: params[:editor][:surname], 
                          group_id: 2) 
    editor.update_attribute(:password, "editor")
    @success = "Usuario registrado exitosamente"
    redirect_to me_path
  end

  def grant_permission
    PermissionRequest.find_by(user_id: params[:grant][:user_id].to_i).update_attributes(checked: true, granted: true)
    User.find(params[:grant][:user_id].to_i).update_attribute(:group_id, 3)
    redirect_to me_path   
  end

  def deny_permission
    PermissionRequest.find_by(user_id: params[:deny][:user_id].to_i).update_attributes(checked: true)
    redirect_to me_path   
  end
end

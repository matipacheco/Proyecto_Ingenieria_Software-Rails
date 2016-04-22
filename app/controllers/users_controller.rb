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
    #primero elimiar el editaor anterior
  end
end

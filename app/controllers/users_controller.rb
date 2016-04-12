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
end

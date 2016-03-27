class UsersController < ApplicationController
  def new
    @user =  User.create(email: params[:user][:email], 
                        password: params[:user][:password], 
                        name: params[:user][:name], 
                        surname: params[:user][:surname], 
                        group_id: 4)
    render 'users/login'
    #redirect_to root_url
  end

  def register
  end  
end

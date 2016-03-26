class UsersController < ApplicationController
  def new
    @user =  User.create(email: params[:user][:email], 
                        password: params[:user][:password], 
                        name: params[:user][:name], 
                        surname: params[:user][:surname], 
                        group_id: 4)
    render 'users/login'
  end

  def login
  	@user = User.find_by(email: params[:user][:email])
    if @user && @user.password == params[:user][:password]
      @loged  = true
      render 'welcome/index'
    elsif @user && @user.password != params[:user][:password]
      @info   = "Ususario o clave incorrecta, intentelo de nuevo."
      render 'welcome/index'
    else
      render 'users/new'
  	end
  end

  def register
  end  
end

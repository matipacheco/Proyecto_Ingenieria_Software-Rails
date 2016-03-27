class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.password_auth(params[:session][:password])
      log_in user
      redirect_to root_url
    else user && user.password != params[:session][:password]
      @info   = "Ususario o clave incorrecta, intentelo de nuevo."
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url    
  end    
end
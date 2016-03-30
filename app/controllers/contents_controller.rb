class ContentsController < ApplicationController
  def upload
  	Content.create(description: params[:content][:description], user_id: params[:content][:user_id])
    redirect_to root_url
  end

  def destroy
  	Content.destroy(params[:content][:content_id].to_i)
  	redirect_to root_url
  end
end
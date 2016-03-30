class ContentsController < ApplicationController
  def upload
  	content = Content.create(description: params[:content][:description])
    content.update_attribute(:user_id, params[:content][:user_id].to_i)
    redirect_to root_url
  end

  def destroy
  	Content.destroy(params[:content][:content_id].to_i)
  	redirect_to root_url
  end
end
class ContentsController < ApplicationController
  def upload
  	Content.create(description: params[:content][:description], user_id: params[:content][:user_id])
    render nothing: true
  end
end
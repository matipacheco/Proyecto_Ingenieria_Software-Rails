class CommentsController < ApplicationController
  def new
    comment = Comment.create(description: params[:comment][:description])
    comment.update_attribute(:user_id, params[:comment][:user_id].to_i)
    redirect_to root_url
  end

  def respond
  end
end
class CommentsController < ApplicationController
  def new
    comment = Comment.create(description: params[:comment][:description])
    comment.update_attribute(:user_id, params[:comment][:user_id].to_i)
    redirect_to root_url
  end

  def respond
    @comment = Comment.find(params[:comment][:comment_id].to_i)
  end

  def create_response
    response = Response.create(description: params[:response][:description])
    response.update_attribute(:user_id,    params[:response][:user_id].to_i)
    response.update_attribute(:comment_id, params[:response][:comment_id].to_i)
    binding.pry  
    redirect_to root_url
  end
end
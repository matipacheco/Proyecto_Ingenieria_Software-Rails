class PermissionsController < ApplicationController
  def create
    p = PermissionRequest.create(user_id: params[:permission][:user_id])
    p.update_attribute(:description, params[:permission][:description])
    redirect_to me_url
  end
end
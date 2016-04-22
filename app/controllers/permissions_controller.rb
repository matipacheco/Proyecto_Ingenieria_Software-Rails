class PermissionsController < ApplicationController
  def create
    PermissionRequest.create(user_id: params[:permission][:user_id])
    redirect_to me_url
  end
end
class PermissionRequest < ActiveRecord::Base
  belongs_to  :user
  attr_accessible :checked, :user_id, :granted
end
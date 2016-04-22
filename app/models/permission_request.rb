class PermissionRequest < ActiveRecord::Base
  belongs_to  :user
  attr_accessible :checked, :user_id, :granted

  scope :not_checked, -> {where(checked: false)}
end
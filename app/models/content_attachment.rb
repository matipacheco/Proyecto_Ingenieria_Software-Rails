class ContentAttachment < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to     :content
  attr_accessible :avatar
end
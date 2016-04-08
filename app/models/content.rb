class Content < ActiveRecord::Base
  belongs_to :user
  has_many   :content_attachments
  accepts_nested_attributes_for :content_attachments

  attr_accessible :description
end
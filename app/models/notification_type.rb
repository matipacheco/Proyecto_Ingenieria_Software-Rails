class NotificationType < ActiveRecord::Base
  belongs_to :notifications

  attr_accessible :name
end
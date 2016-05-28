class Notification < ActiveRecord::Base
  has_one :notification_type
  belongs_to :user

  scope :by_user_and_type, lambda { |list|
    where("user_id = (?)", list.first).where("notification_type_id = (?)", list.last)
  }
  scope :musicos, 	  -> {where("notification_type_id = 1")}
  scope :musicologos, -> {where("notification_type_id = 2")}
  scope :melomanos,   -> {where("notification_type_id = 3")}
end
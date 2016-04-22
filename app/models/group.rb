class Group < ActiveRecord::Base
  belongs_to :user

  attr_accessible :id
end
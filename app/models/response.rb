class Response < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :comment

  attr_accessible :description
end
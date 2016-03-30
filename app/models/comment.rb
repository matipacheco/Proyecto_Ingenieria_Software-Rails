class Comment < ActiveRecord::Base
  belongs_to  :user
  has_many    :responses

  attr_accessible :description
end
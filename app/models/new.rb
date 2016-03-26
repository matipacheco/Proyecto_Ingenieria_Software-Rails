class New < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :description, :url
end
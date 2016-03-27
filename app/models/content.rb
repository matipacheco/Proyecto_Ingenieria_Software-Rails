class Content < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :description, :url
end
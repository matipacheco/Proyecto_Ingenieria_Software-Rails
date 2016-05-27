class VisitorContribution < ActiveRecord::Base
  belongs_to  :user

  attr_accessible :search_term, :description  
end
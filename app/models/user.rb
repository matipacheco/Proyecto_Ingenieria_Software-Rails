class User < ActiveRecord::Base
  has_one  :group
  has_many :contents

  attr_accessible :name, :surname,
  					      :email, :group_id

  def admin?
  	group_id == 1
  end

  def editor?
    group_id == 2
  end

  def privileged_user?
    group_id == 3
  end

  def regular_user?
    group_id == 4
  end  

  def password_auth password
    self.password == password
  end

  def get_name
    self.name + " " + self.surname
  end
end
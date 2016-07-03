class CreateFacebookFriends < ActiveRecord::Migration
  def change
    create_table :facebook_friends do |t|
      t.string :name
      t.string :email
      t.timestamps    	
    end
  end
end
class CreateFacebookEvents < ActiveRecord::Migration
  def change
    create_table :facebook_events do |t|
      t.string :name
      t.string :data
      t.timestamps     	
    end
  end
end

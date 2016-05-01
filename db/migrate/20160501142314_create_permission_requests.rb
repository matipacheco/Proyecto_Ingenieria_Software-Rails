class CreatePermissionRequests < ActiveRecord::Migration
  def change
    create_table :permission_requests do |t|
      t.integer :user_id
      t.string  :description
      t.boolean :granted, default: false
      t.boolean :checked, default: false
   	  t.timestamps
    end
  end
end

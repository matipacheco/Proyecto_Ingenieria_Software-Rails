class CreateVisitorContributions < ActiveRecord::Migration
  def change
    create_table :visitor_contributions do |t|
      t.string  :search_term
      t.string  :description
      t.integer :user_id
      t.timestamps
    end
  end
end

class CreateBillingHours < ActiveRecord::Migration
  def change
    create_table :billing_hours do |t|
      t.float :time
      t.integer :project_id
      t.integer :user_id
    end
    add_index :billing_hours, :project_id
  end
end

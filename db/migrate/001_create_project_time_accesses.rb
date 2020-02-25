class CreateProjectTimeAccesses < ActiveRecord::Migration
  def change
    create_table :project_time_accesses do |t|
      t.float :time
      t.integer :project_id
      t.integer :user_id
    end
    add_index :project_time_accesses, :project_id
  end
end

class AddPurshasedHoursToProject < ActiveRecord::Migration
  def change
    add_column :projects, :purchased_hours, :float
    add_column :projects, :purchased_start_date, :date
  end
end

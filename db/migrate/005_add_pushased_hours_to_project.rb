class ContactTimeZoneToProject < ActiveRecord::Migration
  def change
    add_column :projects, :puchased_hours, :float
    add_column :projects, :puchased_start_date, :date
  end
end

class ContactTimeZoneToProject < ActiveRecord::Migration
  def change
    add_column :projects, :contact_timezone, :string
    add_column :projects, :day_ends_at, :string
  end
end

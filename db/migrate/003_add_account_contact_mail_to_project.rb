class AddAccountContactMailToProject < ActiveRecord::Migration
  def change
    add_column :projects, :account_contact_mail, :string
  end
end

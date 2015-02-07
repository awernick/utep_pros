class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :atw_users, :admin, :boolean, default: false
  end
end

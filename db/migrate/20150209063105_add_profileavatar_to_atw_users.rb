class AddProfileavatarToAtwUsers < ActiveRecord::Migration
  def change
    add_column :atw_users, :profileavatar, :string
  end
end

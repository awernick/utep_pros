class AddSlugToAtwUser < ActiveRecord::Migration
  def change
    add_column :atw_users, :slug, :string
    add_index :atw_users, :slug, unique: true
  end
end

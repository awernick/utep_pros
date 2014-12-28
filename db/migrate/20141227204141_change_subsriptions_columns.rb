class ChangeSubsriptionsColumns < ActiveRecord::Migration
  def change
  	rename_column :atw_rseventspro_users, :ide, :event_id
  	rename_column :atw_rseventspro_users, :idu, :user_id
  end
end

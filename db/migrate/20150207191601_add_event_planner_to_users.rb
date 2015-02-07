class AddEventPlannerToUsers < ActiveRecord::Migration
  def change
    add_column :atw_users, :event_planner, :boolean, default: false
  end
end

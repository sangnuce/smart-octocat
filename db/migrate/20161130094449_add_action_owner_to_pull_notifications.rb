class AddActionOwnerToPullNotifications < ActiveRecord::Migration[5.0]
  def change
    add_column :pull_notifications, :action_owner_id, :integer
    add_column :pull_notifications, :replied, :boolean
  end
end

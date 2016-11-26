class CreatePullNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :pull_notifications do |t|
      t.references :pull_request, foreign_key: true
      t.integer :chatwork_message_id
      t.integer :action
    end
  end
end

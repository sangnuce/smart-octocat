class CreatePullRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :pull_requests do |t|
      t.string :url
      t.text :description
      t.references :user_room, foreign_key: true
      t.string :state
      t.boolean :merged
      t.integer :merged_by_id
      t.integer :reviewer_num
      t.integer :happy_reviewer_num

      t.timestamps
    end
  end
end

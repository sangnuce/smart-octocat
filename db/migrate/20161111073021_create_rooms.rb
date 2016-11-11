class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :chatwork_id
      t.string :name
      t.string :project_github_link

      t.timestamps
    end
  end
end

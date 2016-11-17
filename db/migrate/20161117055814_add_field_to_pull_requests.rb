class AddFieldToPullRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :pull_requests, :title, :string
    add_column :pull_requests, :deployed, :boolean
  end
end

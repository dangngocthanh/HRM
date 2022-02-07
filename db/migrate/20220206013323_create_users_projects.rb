class CreateUsersProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :users_projects do |t|
      t.column :user_id, :bigint
      t.column :project_id, :bigint
      t.foreign_key :users, foreign_key: true
      t.foreign_key :projects, foreign_key: true
      t.timestamps
    end
  end
end

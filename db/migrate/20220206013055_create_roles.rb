class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.column :user_id, :bigint
      t.column :role_name_id, :bigint
      t.timestamps
      t.foreign_key :users, index: true, foreign_key: true
      t.foreign_key :role_names, index: true, foreign_key: true
    end
  end
end

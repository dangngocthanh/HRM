class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.column :name, :string
      t.column :department_id,:bigint
      t.column :user_id, :bigint
      t.column :status, :string
      t.foreign_key :departments, foreign_key: true
      t.foreign_key :users, foreign_key: true
      t.timestamps
    end
  end
end

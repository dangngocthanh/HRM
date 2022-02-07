class CreateUsersDepartments < ActiveRecord::Migration[7.0]
  def change
    create_table :users_departments do |t|
      t.column :user_id,:bigint
      t.column :department_id,:bigint
      t.foreign_key :users, index: true , foreign_key: true
      t.foreign_key :departments, foreign_key: true
      t.timestamps
    end
  end
end

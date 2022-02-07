class CreateDepartments < ActiveRecord::Migration[7.0]
  def change
    create_table :departments do |t|
      t.column :name, :string
      t.column :user_id, :bigint
      t.foreign_key :users, foreign_key: true
      t.timestamps
    end
  end
end

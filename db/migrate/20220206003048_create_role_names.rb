class CreateRoleNames < ActiveRecord::Migration[7.0]
  def change
    create_table :role_names do |t|
      t.column :name, :string
      t.timestamps
    end

    RoleName.create :name => "Admin"
    RoleName.create :name => "HR"
    RoleName.create :name => "PM"
    RoleName.create :name => "Dev"
    RoleName.create :name => "Chưa Phân Role"
  end
end

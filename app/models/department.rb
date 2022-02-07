class Department < ApplicationRecord
  has_one :user
  has_many :projects
  has_many :users_departments
end

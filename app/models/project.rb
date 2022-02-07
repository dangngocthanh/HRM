class Project < ApplicationRecord
  has_one :user
  has_many :users_projects
  has_one :department
end

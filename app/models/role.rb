class Role < ApplicationRecord
  has_one :user
  has_one :role_name
end

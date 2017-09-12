class Elder < ApplicationRecord
  has_secure_password
  has_many :tasks
end

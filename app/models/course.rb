class Course < ApplicationRecord
  has_many :groups, dependent: :destroy
  has_many :students, through: :groups

  validates :name, uniqueness: true
end

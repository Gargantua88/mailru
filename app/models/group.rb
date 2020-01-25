class Group < ApplicationRecord
  has_and_belongs_to_many :students
  belongs_to :course

  validates :start_time, presence: true
end

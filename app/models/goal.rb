class Goal < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :due, presence: true
end

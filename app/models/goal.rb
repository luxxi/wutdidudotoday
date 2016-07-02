class Goal < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :due, presence: true
  scope :active, -> { where("due >= ?", Time.now).order(created_at: :desc) }
end

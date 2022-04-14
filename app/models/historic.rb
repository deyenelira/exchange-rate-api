class Historic < ApplicationRecord
  validates :success, presence: true
  validates :timestamp, presence: true
  validates :base, presence: true
  validates :date, presence: true
  validates :rates, presence: true

end
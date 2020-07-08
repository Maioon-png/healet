class Weight < ApplicationRecord
  belongs_to :user

  validates :weight, :recorded_date, presence: true
end

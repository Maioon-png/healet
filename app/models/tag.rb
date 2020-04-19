class Tag < ApplicationRecord
  validates :name, presence:true, length:{maximum:50}

  has_many :topics_tags
  has_many :topics, through: :topics_tags
end

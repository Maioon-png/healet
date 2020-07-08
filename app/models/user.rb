class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :weights
  has_many :meals
  has_many :topics
  has_many :comments

  validates :name, :start_weight, :target_weight, presence: true 
  validates :start_weight, :target_weight, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 999 } 
end

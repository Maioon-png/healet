class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :weights
  has_many :meals
  has_many :topics
  has_many :comments

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.start_weight = 67
      user.target_weight = 58
      user.name = "ゲストユーザー"

    end
  end

end

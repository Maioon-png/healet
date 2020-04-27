class Topic < ApplicationRecord
  validates :content, presence:true

  belongs_to :user
  has_many :comments
  has_many :topics_tags
  has_many :tags, through: :topics_tags
  has_many :likes, dependent: :destroy

  def save_tags(tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    # Destroy old taggings:
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name: old_name)
    end

    # Create new taggings:
    new_tags.each do |new_name|
      topic_tag = Tag.find_or_create_by(name: new_name)
      self.tags << topic_tag
    end
  end

  scope :from_tag, -> (tag_id)  { where(id: topic_ids = TopicsTag.where(tag_id: tag_id).select(:topic_id))}

  # いいね機能
  def do_like(user)
    likes.create(user_id: user.id)
  end

  def delete_like(user)
    likes.find_by(user_id: user.id).destroy
  end

end

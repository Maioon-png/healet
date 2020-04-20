class AddIndexToTopicsTags < ActiveRecord::Migration[5.2]
  def change
    add_index :topics_tags, [:topic_id, :tag_id]
  end
end

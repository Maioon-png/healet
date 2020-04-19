class AddIndexToTopics < ActiveRecord::Migration[5.2]
  def change
    add_index :topics, :title
  end
end

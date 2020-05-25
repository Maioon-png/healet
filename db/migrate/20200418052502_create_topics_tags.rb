class CreateTopicsTags < ActiveRecord::Migration[5.2]
  def change
    create_table :topics_tags do |t|
      t.integer :topic_id, null: false, foreign_key: true
      t.integer :tag_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end

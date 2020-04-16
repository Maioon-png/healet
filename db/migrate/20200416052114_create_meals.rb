class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.string :morning
      t.string :lunch
      t.string :dinner
      t.string :other
      t.datetime :recorded_date
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

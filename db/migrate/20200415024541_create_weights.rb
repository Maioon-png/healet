class CreateWeights < ActiveRecord::Migration[5.2]
  def change
    create_table :weights do |t|
      t.decimal :weight, precision: 4, scale: 1
      t.datetime :recorded_date
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

class CreateWeights < ActiveRecord::Migration[5.2]
  def change
    create_table :weights do |t|
      t.decimal :weight, precision: 5, scale: 2
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

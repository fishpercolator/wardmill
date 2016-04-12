class CreateDataRows < ActiveRecord::Migration
  def change
    create_table :data_rows do |t|
      t.references :dataset, index: true, foreign_key: true
      t.references :ward, index: true, foreign_key: true
      t.string :row

      t.timestamps null: false
    end
  end
end

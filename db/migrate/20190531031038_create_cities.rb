class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.boolean :capital
      t.references :state, foreign_key: true
      t.datetime  :deleted_at

      t.timestamps
    end
    add_index :cities, :name
    add_index :cities, :deleted_at
  end
end

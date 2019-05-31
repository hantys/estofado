class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :note
      t.integer :status
      t.datetime  :deleted_at

      t.timestamps
    end
    add_index :products, :deleted_at
  end
end

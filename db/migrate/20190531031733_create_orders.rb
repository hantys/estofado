class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :client, foreign_key: true
      t.references :product, foreign_key: true
      t.float :cost
      t.float :paid
      t.date :payday
      t.integer :status, default: 0
      t.text :note
      t.datetime  :deleted_at

      t.timestamps
    end
    add_index :orders, :deleted_at
  end
end

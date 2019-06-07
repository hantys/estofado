class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.references :user, foreign_key: true
      t.references :order, foreign_key: true
      t.float :value
      t.date :payday
      t.integer :status, default: 0
      t.text :note
      t.datetime  :deleted_at

      t.timestamps
    end
    add_index :payments, :deleted_at
  end
end

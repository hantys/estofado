class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.integer :customer_reminder

      t.timestamps
    end
  end
end

class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.string :name
      t.string :acronym
      t.datetime  :deleted_at

      t.timestamps
    end
    add_index :states, :name
    add_index :states, :acronym
    add_index :states, :deleted_at
  end
end

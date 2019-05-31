class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :cpf
      t.string :image
      t.string :status
      t.datetime  :deleted_at

      t.timestamps
    end
    add_index :clients, :deleted_at
  end
end

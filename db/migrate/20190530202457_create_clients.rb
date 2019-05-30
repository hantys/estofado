class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :cpf
      t.string :image
      t.string :status

      t.timestamps
    end
  end
end

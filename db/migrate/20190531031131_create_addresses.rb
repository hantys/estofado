class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.belongs_to :addressable, polymorphic: true, index: { name: 'index_addresses_addressable' }
      t.string :cep
      t.string :street
      t.string :number
      t.references :city, foreign_key: true
      t.references :state, foreign_key: true
      t.datetime  :deleted_at

      t.timestamps
    end
    add_index :addresses, :deleted_at
  end
end

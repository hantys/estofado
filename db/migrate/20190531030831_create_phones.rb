class CreatePhones < ActiveRecord::Migration[5.2]
  def change
    create_table :phones do |t|
      t.belongs_to :phoneable, polymorphic: true, index: { name: 'index_phones_phoneable' }
      t.string :number
      t.datetime  :deleted_at

      t.timestamps
    end
    add_index :phones, :deleted_at
  end
end

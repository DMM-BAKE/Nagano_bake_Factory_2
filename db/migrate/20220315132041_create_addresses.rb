class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      
      t.integer :custamer_id
      t.string :potal_code
      t.string :address
      t.string :name
      
      t.timestamps
    end
  end
end
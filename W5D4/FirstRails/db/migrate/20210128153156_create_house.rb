class CreateHouse < ActiveRecord::Migration[6.1]
  def change
    create_table :houses do |t|
      t.string :name, null: false 
      t.integer :person_id, null: false
      t.timestamps
    end
    add_index :houses, :person_id, unique: true 
  end
end

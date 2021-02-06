class ChangeHouseandPeopleTable < ActiveRecord::Migration[6.1]
  def change
    add_column :people, :house_id, :integer, null: false 
    add_index :people, :house_id 

    remove_column :houses, :person_id 
    add_column :houses, :address, :string


  end
end

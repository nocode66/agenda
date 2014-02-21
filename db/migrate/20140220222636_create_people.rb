class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :telephone_number
      t.string :fax_number

      t.timestamps
    end
  end
end

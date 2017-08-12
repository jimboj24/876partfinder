class CreateParts < ActiveRecord::Migration[5.1]
  def change
    create_table :parts do |t|
      t.string :make
      t.string :model
      t.string :vin
      t.string :year
      t.string :part_name
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.string :phone_number
      t.string :part_status

      t.timestamps
    end
  end
end

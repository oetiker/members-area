class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :mobil_number
      t.string :date_of_joining
      t.string :exit_date
      t.boolean :choir_active
      t.string :voice

      t.timestamps null: false
    end
  end
end

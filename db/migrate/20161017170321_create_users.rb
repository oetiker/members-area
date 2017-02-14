class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email

      t.string :mobil_number
      t.string :date_of_joining
      t.string :exit_date
      t.boolean :choir_active, default: false, null: false
      t.string :role, null: false, default: 'guest'
      t.string :voice


      t.string :password_digest

      t.timestamps null: false
    end
  end
end

class AddChangedPasswordFlagToUsers < ActiveRecord::Migration
  def change
    add_column :users, :changed_password, :boolean, default: false 
  end
end

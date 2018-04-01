class AddChoirPassive < ActiveRecord::Migration
  def change
    add_column :users, :choir_passive, :boolean, default: false
  end
end

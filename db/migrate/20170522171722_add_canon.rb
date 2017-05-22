class AddCanon < ActiveRecord::Migration
  def change
    add_column :songs, :canon, :boolean
  end
end

class AlterSongs < ActiveRecord::Migration
  def change
    add_column :songs, :sopran, :boolean
    add_column :songs, :alt, :boolean
    add_column :songs, :tenor, :boolean
    add_column :songs, :bass, :boolean
  end
end

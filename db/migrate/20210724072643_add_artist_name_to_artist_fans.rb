class AddArtistNameToArtistFans < ActiveRecord::Migration[6.0]
  def change
    add_column :artist_fans, :artist_name, :string
  end
end

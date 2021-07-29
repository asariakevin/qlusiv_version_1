class CreateArtistFans < ActiveRecord::Migration[6.0]
  def change
    create_table :artist_fans do |t|
      t.references :fan, null: false, foreign_key: true
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateArtistProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :artist_profiles do |t|
      t.text :name
      t.text :bio
      t.text :city
      t.text :image_url
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end

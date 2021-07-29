class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :caption
      t.text :image_url
      t.text :video_url
      t.integer :like
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end

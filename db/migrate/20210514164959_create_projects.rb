class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.text :title
      t.integer :support
      t.integer :supports
      t.integer :plays
      t.integer :likes
      t.text :video_url
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end

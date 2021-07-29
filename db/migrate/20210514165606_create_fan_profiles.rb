class CreateFanProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :fan_profiles do |t|
      t.text :image_url
      t.text :name
      t.references :fan, null: false, foreign_key: true

      t.timestamps
    end
  end
end

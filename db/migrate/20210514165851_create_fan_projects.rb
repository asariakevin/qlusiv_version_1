class CreateFanProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :fan_projects do |t|
      t.references :fan, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end

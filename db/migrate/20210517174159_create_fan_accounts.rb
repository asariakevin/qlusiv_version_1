class CreateFanAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :fan_accounts do |t|
      t.integer :balance
      t.string :number
      t.references :fan, null: false, foreign_key: true

      t.timestamps
    end
  end
end

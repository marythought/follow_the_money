class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :amount
      t.references :donor, index: true, foreign_key: true
      t.references :organization, index: true, foreign_key: true
      t.date :date

      t.timestamps null: false
    end
  end
end

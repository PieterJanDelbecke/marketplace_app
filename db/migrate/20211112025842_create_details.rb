class CreateDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :details do |t|
      t.string :first_name
      t.string :last_name
      t.integer :street_number
      t.string :street_name
      t.string :suburb
      t.integer :postcode
      t.string :state
      t.integer :phone_number
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

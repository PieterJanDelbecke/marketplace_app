class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.integer :new
      t.integer :sold
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

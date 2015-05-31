class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      # t.string :image
      t.integer :price
      t.string :description

      t.timestamps null: false
    end
  end
end

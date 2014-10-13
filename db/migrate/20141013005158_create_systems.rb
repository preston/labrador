class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
      t.string :title
      t.string :subtitle
      t.text :about
      t.string :copyright_link
      t.string :copyright_holder

      t.timestamps
    end
    add_index :systems, :title, unique: true
  end
end

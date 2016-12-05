class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :name
      t.string :paper_size
      t.float :width
      t.float :height
      t.float :margin
      t.integer :page_count
      t.text :sections

      t.timestamps null: false
    end
  end
end

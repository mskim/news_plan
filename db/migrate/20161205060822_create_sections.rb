class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :issue_id
      t.string :name
      t.integer :page_number
      t.boolean :color_page
      t.boolean :has_heading
      t.string :grid_base
      t.string :ad_type
      t.integer :box_count

      t.timestamps null: false
    end
  end
end

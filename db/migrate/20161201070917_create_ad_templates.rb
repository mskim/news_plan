class CreateAdTemplates < ActiveRecord::Migration
  def change
    create_table :ad_templates do |t|
      t.string :name
      t.string :column_count
      t.string :grid_width
      t.string :grid_height

      t.timestamps null: false
    end
  end
end

class CreateSectionTemplates < ActiveRecord::Migration
  def change
    create_table :section_templates do |t|
      t.string :grid_base
      t.string :grid_key
      t.boolean :has_heading

      t.timestamps null: false
    end
  end
end

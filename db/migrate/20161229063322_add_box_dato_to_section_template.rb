class AddBoxDatoToSectionTemplate < ActiveRecord::Migration
  def change
    add_column :section_templates, :box_data, :text
  end
end

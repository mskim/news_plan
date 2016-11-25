class CreateArticleBoxes < ActiveRecord::Migration
  def change
    create_table :article_boxes do |t|
      t.text :grid_frame
      t.integer :section_template_id

      t.timestamps null: false
    end
  end
end

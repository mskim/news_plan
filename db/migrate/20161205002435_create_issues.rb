class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.integer :publication_id
      t.date :date
      t.text :issue_plan

      t.timestamps null: false
    end
  end
end

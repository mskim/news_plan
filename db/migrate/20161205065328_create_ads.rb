class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :section_id
      t.string :integer
      t.string :ad_type
      t.string :advertiser

      t.timestamps null: false
    end
  end
end

class CreateHasSubcategories < ActiveRecord::Migration
  def change
    create_table :has_subcategories do |t|
      t.references :article, index: true, foreign_key: true
      t.references :subcategory, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

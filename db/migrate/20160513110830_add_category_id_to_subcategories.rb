class AddCategoryIdToSubcategories < ActiveRecord::Migration
  def change
    add_reference :subcategories, :category, index: true, foreign_key: true
  end
end

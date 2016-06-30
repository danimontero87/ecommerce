class RemovesubcategoryIdfromArticles < ActiveRecord::Migration
  def change
    remove_column :Articles, :subcategory_id

  end
end

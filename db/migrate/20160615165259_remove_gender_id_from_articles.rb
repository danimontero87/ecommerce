class RemoveGenderIdFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :gender_id, :integer
  end
end

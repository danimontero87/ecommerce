class AddPointToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :points, :integer
  end
end

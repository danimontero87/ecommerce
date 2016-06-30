class AddColumnVisitsCountToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :visits_count, :integer
  end
end

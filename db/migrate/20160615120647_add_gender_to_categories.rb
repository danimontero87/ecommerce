class AddGenderToCategories < ActiveRecord::Migration
  def change
    add_reference :genders, :category, index: true, foreign_key: true

  end
end

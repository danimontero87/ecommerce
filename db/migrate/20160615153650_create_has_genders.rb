class CreateHasGenders < ActiveRecord::Migration
  def change
    create_table :has_genders do |t|
      t.references :article, index: true, foreign_key: true
      t.references :gender, index: true, foreign_key: true
    end
  end
end

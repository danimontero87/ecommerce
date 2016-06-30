class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id, :null => false
      t.string :name
      t.string :last_name
      t.string :birth_date
      t.string :city

      t.timestamps null: false
    end
  end
end

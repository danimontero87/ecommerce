class Category < ActiveRecord::Base
  validates :name, presence: true

  has_many :genders
  has_many :has_categories
  has_many :subcategories
  has_many :products
  has_many :articles, through: :has_categories


  scope :publicados, ->{ where(state: "published") }
  scope :ultimos, -> { order("created_at DESC")}
  scope :vistos, -> { order("visits_count").reverse_order}
end

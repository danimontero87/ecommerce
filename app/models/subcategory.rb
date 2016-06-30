class Subcategory < ActiveRecord::Base
  has_many :products
  has_many :has_subcategories
  has_many :articles, through: :has_subcategories

  belongs_to :category
end

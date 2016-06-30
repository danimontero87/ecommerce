class Gender < ActiveRecord::Base
  has_many :has_genders
  has_many :articles, through: :has_genders
  belongs_to :category
end

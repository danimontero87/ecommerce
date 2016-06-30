class HasSubcategory < ActiveRecord::Base
  belongs_to :article
  belongs_to :subcategory
end

class HasGender < ActiveRecord::Base
  belongs_to :article
  belongs_to :gender
end

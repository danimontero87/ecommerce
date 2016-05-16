# == Schema Information
#
# Table name: products
#
#  id                  :integer          not null, primary key
#  name                :string
#  pricing             :integer
#  description         :text
#  user_id             :integer
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :subcategory
  belongs_to :user
  has_many :attachments
  validates_presence_of :name,:user,:pricing
  validates :pricing, numericality: {greater_than: 0}

  has_attached_file :avatar, styles: { medium: "300x300", thumb: "100x100"},default_url: "missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/


def paypal_form
{name: name, sku: :item, price: (pricing / 100), currency: "EUR", quantity: 1  }
end

def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |product|
      csv << product.attributes.values_at(*column_names)
    end
  end
end


end

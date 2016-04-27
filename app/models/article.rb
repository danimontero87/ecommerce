class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  after_create :save_categories

  def categories=(value)
    @Categories =value

  end


  has_attached_file :cover, styles: {medium: "1280x720", thumb:"400x300"}
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/



  private
  def save_categories
    @Categories.each do |category_id|
      HasCategory.create(category_id: category_id, article_id: self.id)
    end

  end
end

class Article < ActiveRecord::Base

  include AASM
  belongs_to :user
  has_many :comments

  after_create :save_categories

  def categories=(value)
    @Categories =value

  end


  has_attached_file :cover, styles: {medium: "1280x720", thumb:"400x300"}
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

  scope :publicados, ->{ where(state: "published") }
  scope :ultimos, -> { order("created_at DESC")}

  aasm column: "state" do
    state :in_draft, initial: true
    state :published

    event :publish do
      transitions from: :in_draft, to: :published

    end

    event :unpublish do
      transitions from: :published, to: :in_draft
    end
  end



  private
  def save_categories
    @Categories.each do |category_id|
      HasCategory.create(category_id: category_id, article_id: self.id)
    end

  end
end

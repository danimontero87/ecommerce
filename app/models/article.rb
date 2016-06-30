class Article < ActiveRecord::Base

  include AASM
  belongs_to :user

  has_many :comments
  has_many :has_categories
  has_many :categories, through: :has_categories
  has_many :has_subcategories
  has_many :subcategories, through: :has_subcategories

  has_many :has_genders
  has_many :genders, through: :has_genders
 before_create :set_visits_count





  has_attached_file :cover, styles: {medium: "1280x720", thumb:"400x300"}
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

  scope :publicados, ->{ where(state: "published") }
  scope :ultimos, -> { order("created_at DESC")}
  scope :vistos, -> { order("visits_count").reverse_order}

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


def update_visits_count
  self.update(visits_count: self.visits_count + 1)
end


  private


  def set_visits_count

      self.visits_count = 0
  end



end

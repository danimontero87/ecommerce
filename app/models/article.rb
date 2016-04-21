class Article < ActiveRecord::Base
  belongs_to :user


  has_attached_file :cover, styles: {medium: "1280x720", thumb:"400x300"}
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
end

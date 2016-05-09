class Photo < ActiveRecord::Base
  belongs_to :house

  has_attached_file :image, styles: { medium: "400x400>", thumb: "150x150>" }, :default_url => ":style/missing_avatar.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end

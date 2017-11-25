class Establishment < ApplicationRecord

  # Upload image with Paperclip

  has_attached_file :image, styles: {
    square: "285x285#"
  }, default_url: "missing.png"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  # Validations

  validates :name, :description, :city, :address, :district, presence: true
  validates :name, uniqueness: true

  # Tags

  acts_as_taggable
  
end

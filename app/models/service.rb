class Service < ApplicationRecord


  # Validations

  validates :name, :description, presence: true
  validates_uniqueness_of :name, case_sensitive: false

end

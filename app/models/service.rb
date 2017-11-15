class Service < ApplicationRecord


  # Validations

  validates :name, :description, presence: true

end

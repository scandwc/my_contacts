class Employment < ApplicationRecord
  # Direct associations

  belongs_to :contact

  belongs_to :company

  # Indirect associations

  # Validations

  validates :company_id, :presence => true

  validates :contact_id, :presence => true

end

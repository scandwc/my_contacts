class Employment < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :company_id, :presence => true

  validates :contact_id, :presence => true

end

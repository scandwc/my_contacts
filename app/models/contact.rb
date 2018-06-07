class Contact < ApplicationRecord
  # Direct associations

  has_many   :employments,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :name, :presence => true

end

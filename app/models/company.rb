class Company < ApplicationRecord
  # Direct associations

  has_many   :employments,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :name, :uniqueness => true

  validates :name, :presence => true

end

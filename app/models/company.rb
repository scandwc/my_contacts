class Company < ApplicationRecord
  # Direct associations

  has_many   :employments,
             :dependent => :destroy

  # Indirect associations

  has_many   :contacts,
             :through => :employments,
             :source => :contact

  # Validations

  validates :name, :uniqueness => true

  validates :name, :presence => true

end

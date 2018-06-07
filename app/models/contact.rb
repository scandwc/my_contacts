class Contact < ApplicationRecord
  # Direct associations

  belongs_to :category

  has_many   :comments,
             :dependent => :destroy

  has_many   :employments,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :name, :presence => true

end

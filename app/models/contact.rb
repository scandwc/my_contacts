class Contact < ApplicationRecord
  # Direct associations

  belongs_to :user

  belongs_to :category

  has_many   :comments,
             :dependent => :destroy

  has_many   :employments,
             :dependent => :destroy

  # Indirect associations

  has_many   :companies,
             :through => :employments,
             :source => :company

  # Validations

  validates :name, :presence => true

end

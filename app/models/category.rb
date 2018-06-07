class Category < ApplicationRecord
  # Direct associations

  has_many   :contacts,
             :dependent => :destroy

  # Indirect associations

  # Validations

end

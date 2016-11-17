class Style < ApplicationRecord
  validates :name, length: {minimum: 5 , maximum: 15} ,:presence => true

end

class Bicycle < ApplicationRecord
  validates :name, length: {minimum: 5 , maximum: 15} ,:presence => true
  validates :description, length: {minimum: 10 } ,:presence => true
  validates :price,  numericality: true ,:presence => true
  validates_associated :style

  belongs_to :style
end

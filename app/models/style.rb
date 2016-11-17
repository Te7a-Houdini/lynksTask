class Style < ApplicationRecord
  validates :name, length: {minimum: 5 , maximum: 15} ,:presence => true
  has_many :bicycles
end

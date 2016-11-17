class Bicycle < ApplicationRecord
  validates :name, length: {minimum: 5 , maximum: 15} ,:presence => true
  validates :description, length: {minimum: 10 } ,:presence => true
  validates :price,  numericality: true ,:presence => true
  validates_associated :style
  mount_uploader :image_link , PicUploader
  belongs_to :style
end

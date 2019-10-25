class Cocktail < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :doses, :dependent => :destroy
  has_many :ingredients, through: :doses
  validates :name, allow_blank: false, presence: true, uniqueness: true
end

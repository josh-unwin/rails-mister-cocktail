class Cocktail < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :doses, :dependent => :destroy
  has_many :ingredients, through: :doses
  has_many :reviews
  validates :name, allow_blank: false, presence: true, uniqueness: true
end

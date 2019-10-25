class Ingredient < ApplicationRecord
  has_many :doses
  validates :name, allow_blank: false, presence: true, uniqueness: true
end

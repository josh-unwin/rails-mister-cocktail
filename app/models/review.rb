class Review < ApplicationRecord
  belongs_to :cocktail

  validates :rating, presence: true, length: { in: 1..5 }
end

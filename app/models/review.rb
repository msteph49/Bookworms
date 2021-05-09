class Review < ApplicationRecord

  belongs_to :user
  belongs_to :book
  validates :title, :rating, :review, presence: true
end

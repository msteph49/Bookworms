class Book < ApplicationRecord
  has_many :reviews
  belongs_to :genre
  belongs_to :author
end

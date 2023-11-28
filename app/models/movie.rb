class Movie < ApplicationRecord
  validates :title, presence: true
  validates :category, presence: true
end

class Movie < ApplicationRecord
  has_many :scenes
  has_many :places
end

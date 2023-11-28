class Scene < ApplicationRecord
  belongs_to :place
  belongs_to :movie
  belongs_to :user
  has_many :reviews
  has_many :favorites
end

class Scene < ApplicationRecord
  belongs_to :place
  belongs_to :movie
  belongs_to :user, optional: true

  validates :rating, presence: true
  validates :content, presence: true

  has_many :reviews
  has_many :favorites

end

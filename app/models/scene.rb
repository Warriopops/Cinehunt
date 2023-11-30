class Scene < ApplicationRecord
  attr_reader :address

  belongs_to :place
  belongs_to :movie
  belongs_to :user, optional: true

  validates :rating, presence: true
  validates :content, presence: true

  has_many :reviews, dependent: :destroy
  has_many :favorites

end

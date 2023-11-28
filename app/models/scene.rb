class Scene < ApplicationRecord
  belongs_to :place
  belongs_to :movie
  belongs_to :user

  validates :rating, presence: true
  validates :content, presence: true
  validates :payant, presence: true
  
  has_many :reviews
  has_many :favorites

end

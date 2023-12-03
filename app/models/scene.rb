class Scene < ApplicationRecord
  attr_reader :address

  belongs_to :place
  belongs_to :movie
  belongs_to :user, optional: true

  validates :content, presence: true

  has_many :reviews, dependent: :destroy
  has_many :favorites

  has_one_attached :photo

end

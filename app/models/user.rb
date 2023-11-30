class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorite_lists, dependent: :destroy
  has_many :favorites, through: :favorite_lists, dependent: :destroy
  validates :username, presence: true, uniqueness: true
  has_many :reviews
  has_many :scenes

  def certified?
    self.certification
  end
end

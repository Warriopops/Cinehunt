class Review < ApplicationRecord
  belongs_to :scene
  belongs_to :user
end

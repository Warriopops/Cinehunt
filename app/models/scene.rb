class Scene < ApplicationRecord
  belongs_to :place
  belongs_to :movie
  belongs_to :user
end

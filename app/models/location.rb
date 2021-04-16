class Location < ApplicationRecord
  validates :range, presence: true
end

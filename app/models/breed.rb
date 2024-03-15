class Breed < ApplicationRecord
  belongs_to :user
  has_many :sub_breeds

  validates :name, presence: true
end

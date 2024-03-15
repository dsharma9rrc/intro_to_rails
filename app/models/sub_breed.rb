class SubBreed < ApplicationRecord
  belongs_to :breed
  
  validates :name, presence: true
end

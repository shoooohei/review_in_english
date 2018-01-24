class Correction < ApplicationRecord
  validates :content, presence: true

  has_many :clikes, dependent: :destroy
  belongs_to :user
  belongs_to :review
end

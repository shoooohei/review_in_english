class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  has_many :rlikes, dependent: :destroy
  has_many :rlike_user, through: :rlikes, source: :user
  has_many :corrections
  has_many :phrases, dependent: :destroy

  validates :content, presence: true
end

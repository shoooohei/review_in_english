class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  has_many :rlikes, dependent: :destroy
  has_many :rlike_user, through: :rlikes, source: :user
  has_many :corrections
  has_many :phrases, dependent: :destroy
  accepts_nested_attributes_for :phrases, allow_destroy: true

  validates :review_or_phrase, presence: true

  private
  def review_or_phrase
    content.presence or phrases.presence
  end
end

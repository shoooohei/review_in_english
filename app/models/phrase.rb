class Phrase < ApplicationRecord
  belongs_to :review, optional: true

  validates :content, presence: true
end

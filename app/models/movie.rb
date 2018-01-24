class Movie < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :reviews

  validates :en_title, presence: true
end

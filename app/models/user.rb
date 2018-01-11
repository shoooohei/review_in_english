class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :user_icon
  has_many :reviews, dependent: :destroy
  has_many :review_movies, through: :reviews, source: :movie
  has_many :corrections, dependent: :destroy
  has_many :correction_reviews, through: :corrections, source: :review
end

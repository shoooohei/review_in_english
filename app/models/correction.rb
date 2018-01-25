class Correction < ApplicationRecord
  has_many :clikes, dependent: :destroy
  belongs_to :user
  belongs_to :review

  validates :content, presence: true
  validate :prevent_same_person

  def prevent_same_person
    if wether_correction == true
      review_user_id = Review.find(review_id).id
      if review_user_id == user_id
        errors[:base] << "You can't correct by yourself"
      end
    end
  end


end

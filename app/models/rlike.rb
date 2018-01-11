class Rlike < ApplicationRecord
  belongs_to :user
  belongs_to :review, counter_cache: :likes_count
end

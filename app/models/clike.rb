class Clike < ApplicationRecord
  belongs_to :user
  belongs_to :correction, counter_cache: :likes_count
end

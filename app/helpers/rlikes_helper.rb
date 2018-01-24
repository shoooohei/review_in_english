module RlikesHelper
  def rlike_user(review_id, user_id)
    @like = Rlike.find_by(review_id: review_id, user_id: user_id)
  end
end

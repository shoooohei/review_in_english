module ClikesHelper
  def clike_user(correction_id, user_id)
    @like = Clike.find_by(correction_id: correction_id, user_id: user_id)
  end
end

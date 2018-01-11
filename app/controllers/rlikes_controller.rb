class RlikesController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @review_like = Rlike.create(user_id: current_user.id, review_id: params[:review_id])
    @id_comment = params[:review_id]
    @count = @review.likes_count + 1
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @review = Review.find(params[:review_id])
    review_like = Rlike.find(params[:id])
    review_like.destroy
    @id_comment = params[:review_id]
    @count = @review.likes_count - 1
    respond_to do |format|
      format.js
    end
  end
end

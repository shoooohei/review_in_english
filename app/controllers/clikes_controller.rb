class ClikesController < ApplicationController
  def create
    @correction = Correction.find(params[:correction_id])
    @review = @correction.review
    @correction_like = Clike.create(user_id: current_user.id, correction_id: params[:correction_id])
    @id_comment = params[:correction_id]
    @count = @correction.likes_count + 1
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @correction = Correction.find(params[:correction_id])
    @review = @correction.review
    correction_like = Clike.find(params[:id])
    correction_like.destroy
    @id_comment = params[:correction_id]
    @count = @correction.likes_count - 1
    respond_to do |format|
      format.js
    end
  end
end

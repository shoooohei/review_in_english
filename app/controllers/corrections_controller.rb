class CorrectionsController < ApplicationController
  def new
    #reviewに紐づけた新しいcorrectionのインスタンス生成
    @correction = Review.find(params[:format]).corrections.new
    @movie = @correction.review.movie
  end

  def create
    @correction = Correction.new(correction_params)
    if @correction.save
      redirect_to review_path(@correction.review_id)
    elsif params[:commit] == "correct"
      @movie = @correction.review.movie
      render 'new'
    else
      @review = Review.find(@correction.review_id)
      @movie = @review.movie
      @corrections = @review.corrections.order(created_at: :desc)
      render 'reviews/show'
    end
  end



  private
  def correction_params
    params.require(:correction).permit(:content, :review_id, :user_id, :wether_correction)
  end
end

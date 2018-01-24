class CorrectionsController < ApplicationController
  before_action :set_correction, only: [:edit, :cancel, :update, :destroy]


  def new
    #reviewに紐づけた新しいcorrectionのインスタンス生成
    @correction = Review.find(params[:review_id]).corrections.new
    @movie = @correction.review.movie
  end

  def create
    @review = Review.find(params[:review_id])
    @correction = @review.corrections.new(correction_params)
    @correction.save
    @corrections_count = @review.corrections.order(created_at: :asc).last.id
    respond_to do |format|
      format.html {redirect_to review_path(@review)}
      format.js
    end
  end

  def edit
    @review = @correction.review
    respond_to do |format|
      format.js
    end
  end

  def cancel
    respond_to do |format|
      format.js {render :display}
    end
  end

  def update
    respond_to do |format|
      if @correction.update(correction_params)
        format.js {render :display}
      else
        @review = @correction.review
        format.js {render :edit}
      end
    end
  end

  def destroy
    @correction.destroy
    respond_to do |format|
      format.js
    end
  end



  private
  def correction_params
    params.require(:correction).permit(:content, :user_id, :wether_correction)
  end

  def set_correction
    @correction = Correction.find(params[:id])
  end
end

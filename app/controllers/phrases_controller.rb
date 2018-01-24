class PhrasesController < ApplicationController
  before_action :set_phrase_id, only:[:edit, :destroy]

  def new
    review = Review.find(params[:review_id])
    @phrases_count = review.phrases.count
    gon.phrases_count = @phrases_count #add_phraseをjsでtryするため
    @phrase = review.phrases.new

    respond_to do |format|
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def cancel
    @phrase = Phrase.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def destroy
    Phrase.find(params[:id]).destroy
    respond_to do |format|
      format.js
    end
  end


  private
  def phrase_params
    params.require(:phrase).permit(:content,:comment)
  end

  def set_phrase_id
    @phrase_id = params[:id]
  end
end

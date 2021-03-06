class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  include ReviewsHelper

  def index
    @reviews = Review.all.order(created_at: :desc)
    @page = "timeline"
    gon.page = @page
    gon.arg_js_detail = make_arg_for_js(@reviews,@page)[0]
    gon.arg_js_review_id = make_arg_for_js(@reviews,@page)[1]
  end

  def corrected
    # コメントではなく添削したcorrections
    @true_corrections = current_user.corrections.where(wether_correction: true)
    # その中のreview_idを取り出し配列化した降順に並び替え
    @corrected_reviews_ids = @true_corrections.select('review_id').distinct.pluck(:review_id).reverse
  end

  # GET /reviews/new
  def new
    @review = Review.new
    @movie = Movie.find(params[:format])
    @review.phrases.new
    gon.page = "review_new"
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    respond_to do |format|
      if @review.save
        format.html { redirect_to movie_path(@review.movie_id), notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        gon.page = "review_invail"
        # @phrase = params
        @movie = @review.movie
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @movie = @review.movie
    @correction = @review.corrections.new
    @corrections = @review.corrections.order(:created_at)
    @page = "review_show"
    gon.page = @page
    gon.arg_js_detail = make_arg_for_js(@review,@page)[0]
    gon.arg_js_review_id = make_arg_for_js(@review,@page)[1]
    gon.user_name = @review.user.name #リンクをjsで無効化するため
  end


  # GET /reviews/1/edit
  def edit
    @movie = @review.movie
    gon.phrase_count = @review.phrases.count
    @page = "review_edit"
    gon.page = @page
  end


  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update

    # @phrase = @review.phrases.(phrase_params)
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        @movie = @review.movie
        gon.phrase_count = @review.phrases.count
        @page = "review_edit"
        gon.page = @page
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:content, :movie_id, :user_id, :rate, phrases_attributes: [:content,:id, :_destroy])
    end

    def phrase_params
      params.require(:phrase).permit(:content,:comment)
    end

end

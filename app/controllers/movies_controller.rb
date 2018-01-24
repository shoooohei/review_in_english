class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  include ReviewsHelper

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all
  end

  def reviewed
    @reviews = current_user.reviews.order(created_at: :desc)
    # @page = "reviewed_movies"
    # gon.page = "reviewed_movies"
    # gon.arg_js_detail = make_arg_for_js(@reviews, @page)[0]
    # gon.arg_js_review_id = make_arg_for_js(@reviews, @page)[1]
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @reviews = @movie.reviews.where.not(user_id: current_user.id).order(created_at: :desc)
    @own_review = current_user.reviews.find_by(movie_id: @movie.id)
    gon.page = "movie_show"
  end

  # GET /movies/new
  def new
    @movie = Movie.new
    @submit_btn = "作成する"
  end

  # GET /movies/1/edit
  def edit
    @submit_btn = "更新する"
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:jp_title, :en_title, :image, :star, :director, :writer, :playyear, :country, :imdb)
    end
end

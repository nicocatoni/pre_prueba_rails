class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all
  end

  def show
    if @movie.favorite == true
      @favorite = 'Favorita'
    else
      @favorite = 'General'
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movie_path(@movie)
    else
      'Algo salió mal'
    end

  end

  def edit

  end

  def update
    @movie.update(movie_params)
    redirect_to movie_path(@movie)

  end

  def destroy
    @movie.delete
    redirect_to movies_path
  end

  private
  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:name, :year, :favorite)
  end

end

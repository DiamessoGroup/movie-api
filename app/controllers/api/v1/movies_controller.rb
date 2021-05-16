class Api::V1::MoviesController < ApplicationController
  def index
    @movies = Movie.all
    render json: {Message: "Success", data: @movies }, status: 200
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      render json: {Message: "Movie successfully created", data: @movie }, status: 200
    else
      render json: {Message: "Error. Something went wrong. Movie was not created", data: @movie.errors }, status: 400
    end
  end

  def show
    @movie = Movie.find(params[:id])
    if @movie
      render json: {Message: "Success", data: @movie }, status: 200
    else
      render json: {Message: "Error", data: @movie.errors }, status: 400
    end
  end

  def update
    @movie = Movie.find(params[:id])
      if @movie.update(movie_params)
        render json: {Message: "Movie successfully updated", data: @movie }, status: 200
      else
        render json: {Message: "Error. Something went wrong. Movie was not updated", data: @movie }, status: 400
      end
  end

  def destroy
    @movie = Movie.find(params[:id])
    if @movie.destroy
      render json: { Message: "Movie successfully deleted", data: @movie }, status: 200
    else
      render json: {Message: "Error. Something went wrong. Movie was not deleted", data: @movie }, status: 400
    end
  end

  private

  def movie_params
    params.permit(:title, :quote)
  end


end

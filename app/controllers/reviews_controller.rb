class ReviewsController < ApplicationController

  include SessionsHelper

  def new
  end

  def create
    # review_params = review_params.to_h
    # @show_movie = Tmdb::Movie.detail(params[:review][:movie_id])
    @movie = Movie.find_by(:api_id => params[:review][:movie_id].to_i)
    review_hash = {}
    review_hash[:description] = review_params[:description]
    review_hash[:spud_score] = params[:spud_score].to_i if params[:spud_score].to_i > 0
    review_hash[:movie_id] = @movie.id
    review_hash[:user_id] = current_user.id

    @review = Review.new(review_hash)
    if @review.save
      redirect_to "/movies/#{@movie.api_id}"#movie_path(@movie.api_id)
    else
      flash[:notice] = "You're a spoiled spud! Your review is rotten."
      redirect_to "/movies/#{@movie.api_id}"#movie_path(@movie.api_id)
    end

  end

private
  def review_params
    params.require(:review).permit(:description, :spud_score, :movie_id)
  end
end

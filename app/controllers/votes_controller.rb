class VotesController < ApplicationController
  def new
  end

  def create
    review_params
    Vote.create(review_id: review_params[:review_id].to_i, user_id: review_params[:user_id].to_i)
    redirect_to "/movies/#{params[:id].to_i}"
  end

  private
  def review_params
    params.require(:vote_data).permit(:review_id, :user_id)
  end
end

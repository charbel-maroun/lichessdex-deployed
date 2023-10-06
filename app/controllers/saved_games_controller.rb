class SavedGamesController < ApplicationController
  before_action :initialize_saved_games, only: [:index, :create, :destroy]

  # GET /saved_games
  def index
    # byebug
    render json: session[:saved_games]
  end

  # POST /saved_games
  def create
    game_data = saved_game_params
    session[:saved_games] << game_data
    render json: game_data, status: :created
  end

  # DELETE /saved_games/1
  def destroy
    index_to_delete = params[:id].to_i
    if index_to_delete >= 0 && index_to_delete < session[:saved_games].length
      deleted_game = session[:saved_games].delete_at(index_to_delete)
      render json: deleted_game
    else
      head :unprocessable_entity
    end
  end

  private

  def initialize_saved_games
    session[:saved_games] ||= []
  end

  def saved_game_params
    params.permit(:studiedPosition, :notes, :gameID)
  end
end

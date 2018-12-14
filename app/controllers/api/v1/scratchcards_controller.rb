class Api::V1::ScratchcardsController < ApplicationController
  # GET /scratchcards
  def index
    @scratchcards = Scratchcard.where(user_id:params[:user_id]).all
    render json: @scratchcards
  end

  # GET /scratchcards/1
  def show
    @scratchcards = Scratchcard.where(user_id:params[:user_id]).all
    render json: @scratchcards.find(params[:id])
  end

  private
    # Only allow a trusted parameter "white list" through.
    def scratchcard_params
      params.require(:scratchcard).permit(:user_id, :amount)
    end
end

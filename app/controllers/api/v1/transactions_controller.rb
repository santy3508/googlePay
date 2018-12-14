require_dependency "app/services/tez_operations.rb"
require_dependency "app/services/all_transactions.rb"
class Api::V1::TransactionsController < ApplicationController
  # GET /transactions
  def index
    transactions = AllTransactions.new(params[:user_id]).execute_action
    render json: transactions
  end

  # POST /transactions
  def create
    @transaction = TezOperations.new(params[:sender_phone],params[:receiver_phone],params[:amount]).execute_action
    if @transaction.save
      render json: @transaction, status: :created, location: api_v1_transactions_url(@transaction)
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  private
        # Only allow a trusted parameter "white list" through.
    def transaction_params
      params.require(:transaction).permit(:user_id, :id)
    end
    
end

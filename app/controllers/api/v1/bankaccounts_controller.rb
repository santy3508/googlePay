class Api::V1::BankaccountsController < ApplicationController
  before_action :set_bankaccount, only: [:show, :destroy]

  # GET /bankaccounts
  def index
    @user = User.find(params[:user_id])
    @bankaccounts = @user.bankaccounts

    render json: @bankaccounts
  end

  # GET /bankaccounts/1
  def show
    render json: @bankaccount
  end

  # POST /bankaccounts
  def create
    @user = User.find(params[:user_id])
    @bankaccount = @user.bankaccounts.create(params[:bankaccount].permit(:acc_no, :ifsc, :balance, :bank))
    if @bankaccount.save
      render json: @bankaccount, status: :created, location: api_v1_user_bankaccounts_url(@bankaccount)
    else
      render json: @bankaccount.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bankaccounts/1
  def destroy
    @bankaccount.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bankaccount
      @user = User.find(params[:user_id])
      @bankaccount = @user.bankaccounts.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bankaccount_params
      params.require(:bankaccount).permit(:acc_no, :ifsc, :balance, :bank)
    end
end

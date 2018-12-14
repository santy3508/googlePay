require 'test_helper'

class BankaccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bankaccount = bankaccounts(:one)
  end

  test "should get index" do
    get bankaccounts_url, as: :json
    assert_response :success
  end

  test "should create bankaccount" do
    assert_difference('Bankaccount.count') do
      post bankaccounts_url, params: { bankaccount: { acc_no: @bankaccount.acc_no, balance: @bankaccount.balance, bank: @bankaccount.bank, ifsc: @bankaccount.ifsc } }, as: :json
    end

    assert_response 201
  end

  test "should show bankaccount" do
    get bankaccount_url(@bankaccount), as: :json
    assert_response :success
  end

  test "should update bankaccount" do
    patch bankaccount_url(@bankaccount), params: { bankaccount: { acc_no: @bankaccount.acc_no, balance: @bankaccount.balance, bank: @bankaccount.bank, ifsc: @bankaccount.ifsc } }, as: :json
    assert_response 200
  end

  test "should destroy bankaccount" do
    assert_difference('Bankaccount.count', -1) do
      delete bankaccount_url(@bankaccount), as: :json
    end

    assert_response 204
  end
end

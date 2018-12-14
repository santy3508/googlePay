require 'test_helper'

class ScratchcardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scratchcard = scratchcards(:one)
  end

  test "should get index" do
    get scratchcards_url, as: :json
    assert_response :success
  end

  test "should create scratchcard" do
    assert_difference('Scratchcard.count') do
      post scratchcards_url, params: { scratchcard: { amount: @scratchcard.amount, user_id: @scratchcard.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show scratchcard" do
    get scratchcard_url(@scratchcard), as: :json
    assert_response :success
  end

  test "should update scratchcard" do
    patch scratchcard_url(@scratchcard), params: { scratchcard: { amount: @scratchcard.amount, user_id: @scratchcard.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy scratchcard" do
    assert_difference('Scratchcard.count', -1) do
      delete scratchcard_url(@scratchcard), as: :json
    end

    assert_response 204
  end
end

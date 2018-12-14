require 'test_helper'

class TUserId1sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @t_user_id_1 = t_user_id_1s(:one)
  end

  test "should get index" do
    get t_user_id_1s_url, as: :json
    assert_response :success
  end

  test "should create t_user_id_1" do
    assert_difference('TUserId1.count') do
      post t_user_id_1s_url, params: { t_user_id_1: { amount: @t_user_id_1.amount, references: @t_user_id_1.references, t_user_id_2: @t_user_id_1.t_user_id_2 } }, as: :json
    end

    assert_response 201
  end

  test "should show t_user_id_1" do
    get t_user_id_1_url(@t_user_id_1), as: :json
    assert_response :success
  end

  test "should update t_user_id_1" do
    patch t_user_id_1_url(@t_user_id_1), params: { t_user_id_1: { amount: @t_user_id_1.amount, references: @t_user_id_1.references, t_user_id_2: @t_user_id_1.t_user_id_2 } }, as: :json
    assert_response 200
  end

  test "should destroy t_user_id_1" do
    assert_difference('TUserId1.count', -1) do
      delete t_user_id_1_url(@t_user_id_1), as: :json
    end

    assert_response 204
  end
end

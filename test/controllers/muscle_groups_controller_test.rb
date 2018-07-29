require 'test_helper'

class MuscleGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @muscle_group = muscle_groups(:one)
  end

  test "should get index" do
    get muscle_groups_url, as: :json
    assert_response :success
  end

  test "should create muscle_group" do
    assert_difference('MuscleGroup.count') do
      post muscle_groups_url, params: { muscle_group: { name: @muscle_group.name } }, as: :json
    end

    assert_response 201
  end

  test "should show muscle_group" do
    get muscle_group_url(@muscle_group), as: :json
    assert_response :success
  end

  test "should update muscle_group" do
    patch muscle_group_url(@muscle_group), params: { muscle_group: { name: @muscle_group.name } }, as: :json
    assert_response 200
  end

  test "should destroy muscle_group" do
    assert_difference('MuscleGroup.count', -1) do
      delete muscle_group_url(@muscle_group), as: :json
    end

    assert_response 204
  end
end

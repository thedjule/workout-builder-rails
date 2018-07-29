require 'test_helper'

class ExerciseTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exercise_type = exercise_types(:one)
  end

  test "should get index" do
    get exercise_types_url, as: :json
    assert_response :success
  end

  test "should create exercise_type" do
    assert_difference('ExerciseType.count') do
      post exercise_types_url, params: { exercise_type: { name: @exercise_type.name } }, as: :json
    end

    assert_response 201
  end

  test "should show exercise_type" do
    get exercise_type_url(@exercise_type), as: :json
    assert_response :success
  end

  test "should update exercise_type" do
    patch exercise_type_url(@exercise_type), params: { exercise_type: { name: @exercise_type.name } }, as: :json
    assert_response 200
  end

  test "should destroy exercise_type" do
    assert_difference('ExerciseType.count', -1) do
      delete exercise_type_url(@exercise_type), as: :json
    end

    assert_response 204
  end
end

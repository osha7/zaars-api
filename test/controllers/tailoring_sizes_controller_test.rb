require "test_helper"

class TailoringSizesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tailoring_size = tailoring_sizes(:one)
  end

  test "should get index" do
    get tailoring_sizes_url
    assert_response :success
  end

  test "should get new" do
    get new_tailoring_size_url
    assert_response :success
  end

  test "should create tailoring_size" do
    assert_difference('TailoringSize.count') do
      post tailoring_sizes_url, params: { tailoring_size: {  } }
    end

    assert_redirected_to tailoring_size_url(TailoringSize.last)
  end

  test "should show tailoring_size" do
    get tailoring_size_url(@tailoring_size)
    assert_response :success
  end

  test "should get edit" do
    get edit_tailoring_size_url(@tailoring_size)
    assert_response :success
  end

  test "should update tailoring_size" do
    patch tailoring_size_url(@tailoring_size), params: { tailoring_size: {  } }
    assert_redirected_to tailoring_size_url(@tailoring_size)
  end

  test "should destroy tailoring_size" do
    assert_difference('TailoringSize.count', -1) do
      delete tailoring_size_url(@tailoring_size)
    end

    assert_redirected_to tailoring_sizes_url
  end
end

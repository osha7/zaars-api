require "test_helper"

class ListingStylesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @listing_style = listing_styles(:one)
  end

  test "should get index" do
    get listing_styles_url
    assert_response :success
  end

  test "should get new" do
    get new_listing_style_url
    assert_response :success
  end

  test "should create listing_style" do
    assert_difference('ListingStyle.count') do
      post listing_styles_url, params: { listing_style: {  } }
    end

    assert_redirected_to listing_style_url(ListingStyle.last)
  end

  test "should show listing_style" do
    get listing_style_url(@listing_style)
    assert_response :success
  end

  test "should get edit" do
    get edit_listing_style_url(@listing_style)
    assert_response :success
  end

  test "should update listing_style" do
    patch listing_style_url(@listing_style), params: { listing_style: {  } }
    assert_redirected_to listing_style_url(@listing_style)
  end

  test "should destroy listing_style" do
    assert_difference('ListingStyle.count', -1) do
      delete listing_style_url(@listing_style)
    end

    assert_redirected_to listing_styles_url
  end
end

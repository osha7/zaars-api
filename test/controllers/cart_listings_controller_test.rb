require "test_helper"

class CartListingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cart_listing = cart_listings(:one)
  end

  test "should get index" do
    get cart_listings_url
    assert_response :success
  end

  test "should get new" do
    get new_cart_listing_url
    assert_response :success
  end

  test "should create cart_listing" do
    assert_difference('CartListing.count') do
      post cart_listings_url, params: { cart_listing: {  } }
    end

    assert_redirected_to cart_listing_url(CartListing.last)
  end

  test "should show cart_listing" do
    get cart_listing_url(@cart_listing)
    assert_response :success
  end

  test "should get edit" do
    get edit_cart_listing_url(@cart_listing)
    assert_response :success
  end

  test "should update cart_listing" do
    patch cart_listing_url(@cart_listing), params: { cart_listing: {  } }
    assert_redirected_to cart_listing_url(@cart_listing)
  end

  test "should destroy cart_listing" do
    assert_difference('CartListing.count', -1) do
      delete cart_listing_url(@cart_listing)
    end

    assert_redirected_to cart_listings_url
  end
end

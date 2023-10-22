require "test_helper"

class ListingShippingStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @listing_shipping_status = listing_shipping_statuses(:one)
  end

  test "should get index" do
    get listing_shipping_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_listing_shipping_status_url
    assert_response :success
  end

  test "should create listing_shipping_status" do
    assert_difference('ListingShippingStatus.count') do
      post listing_shipping_statuses_url, params: { listing_shipping_status: {  } }
    end

    assert_redirected_to listing_shipping_status_url(ListingShippingStatus.last)
  end

  test "should show listing_shipping_status" do
    get listing_shipping_status_url(@listing_shipping_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_listing_shipping_status_url(@listing_shipping_status)
    assert_response :success
  end

  test "should update listing_shipping_status" do
    patch listing_shipping_status_url(@listing_shipping_status), params: { listing_shipping_status: {  } }
    assert_redirected_to listing_shipping_status_url(@listing_shipping_status)
  end

  test "should destroy listing_shipping_status" do
    assert_difference('ListingShippingStatus.count', -1) do
      delete listing_shipping_status_url(@listing_shipping_status)
    end

    assert_redirected_to listing_shipping_statuses_url
  end
end

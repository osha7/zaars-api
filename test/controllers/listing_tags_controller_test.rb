require "test_helper"

class ListingTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @listing_tag = listing_tags(:one)
  end

  test "should get index" do
    get listing_tags_url
    assert_response :success
  end

  test "should get new" do
    get new_listing_tag_url
    assert_response :success
  end

  test "should create listing_tag" do
    assert_difference('ListingTag.count') do
      post listing_tags_url, params: { listing_tag: {  } }
    end

    assert_redirected_to listing_tag_url(ListingTag.last)
  end

  test "should show listing_tag" do
    get listing_tag_url(@listing_tag)
    assert_response :success
  end

  test "should get edit" do
    get edit_listing_tag_url(@listing_tag)
    assert_response :success
  end

  test "should update listing_tag" do
    patch listing_tag_url(@listing_tag), params: { listing_tag: {  } }
    assert_redirected_to listing_tag_url(@listing_tag)
  end

  test "should destroy listing_tag" do
    assert_difference('ListingTag.count', -1) do
      delete listing_tag_url(@listing_tag)
    end

    assert_redirected_to listing_tags_url
  end
end

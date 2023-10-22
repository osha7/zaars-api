require "application_system_test_case"

class CartListingsTest < ApplicationSystemTestCase
  setup do
    @cart_listing = cart_listings(:one)
  end

  test "visiting the index" do
    visit cart_listings_url
    assert_selector "h1", text: "Cart Listings"
  end

  test "creating a Cart listing" do
    visit cart_listings_url
    click_on "New Cart Listing"

    click_on "Create Cart listing"

    assert_text "Cart listing was successfully created"
    click_on "Back"
  end

  test "updating a Cart listing" do
    visit cart_listings_url
    click_on "Edit", match: :first

    click_on "Update Cart listing"

    assert_text "Cart listing was successfully updated"
    click_on "Back"
  end

  test "destroying a Cart listing" do
    visit cart_listings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cart listing was successfully destroyed"
  end
end

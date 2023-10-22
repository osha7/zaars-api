require "application_system_test_case"

class ListingShippingStatusesTest < ApplicationSystemTestCase
  setup do
    @listing_shipping_status = listing_shipping_statuses(:one)
  end

  test "visiting the index" do
    visit listing_shipping_statuses_url
    assert_selector "h1", text: "Listing Shipping Statuses"
  end

  test "creating a Listing shipping status" do
    visit listing_shipping_statuses_url
    click_on "New Listing Shipping Status"

    click_on "Create Listing shipping status"

    assert_text "Listing shipping status was successfully created"
    click_on "Back"
  end

  test "updating a Listing shipping status" do
    visit listing_shipping_statuses_url
    click_on "Edit", match: :first

    click_on "Update Listing shipping status"

    assert_text "Listing shipping status was successfully updated"
    click_on "Back"
  end

  test "destroying a Listing shipping status" do
    visit listing_shipping_statuses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Listing shipping status was successfully destroyed"
  end
end

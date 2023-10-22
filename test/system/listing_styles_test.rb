require "application_system_test_case"

class ListingStylesTest < ApplicationSystemTestCase
  setup do
    @listing_style = listing_styles(:one)
  end

  test "visiting the index" do
    visit listing_styles_url
    assert_selector "h1", text: "Listing Styles"
  end

  test "creating a Listing style" do
    visit listing_styles_url
    click_on "New Listing Style"

    click_on "Create Listing style"

    assert_text "Listing style was successfully created"
    click_on "Back"
  end

  test "updating a Listing style" do
    visit listing_styles_url
    click_on "Edit", match: :first

    click_on "Update Listing style"

    assert_text "Listing style was successfully updated"
    click_on "Back"
  end

  test "destroying a Listing style" do
    visit listing_styles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Listing style was successfully destroyed"
  end
end

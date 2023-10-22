require "application_system_test_case"

class ListingTagsTest < ApplicationSystemTestCase
  setup do
    @listing_tag = listing_tags(:one)
  end

  test "visiting the index" do
    visit listing_tags_url
    assert_selector "h1", text: "Listing Tags"
  end

  test "creating a Listing tag" do
    visit listing_tags_url
    click_on "New Listing Tag"

    click_on "Create Listing tag"

    assert_text "Listing tag was successfully created"
    click_on "Back"
  end

  test "updating a Listing tag" do
    visit listing_tags_url
    click_on "Edit", match: :first

    click_on "Update Listing tag"

    assert_text "Listing tag was successfully updated"
    click_on "Back"
  end

  test "destroying a Listing tag" do
    visit listing_tags_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Listing tag was successfully destroyed"
  end
end

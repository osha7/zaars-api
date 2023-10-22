require "application_system_test_case"

class TailoringSizesTest < ApplicationSystemTestCase
  setup do
    @tailoring_size = tailoring_sizes(:one)
  end

  test "visiting the index" do
    visit tailoring_sizes_url
    assert_selector "h1", text: "Tailoring Sizes"
  end

  test "creating a Tailoring size" do
    visit tailoring_sizes_url
    click_on "New Tailoring Size"

    click_on "Create Tailoring size"

    assert_text "Tailoring size was successfully created"
    click_on "Back"
  end

  test "updating a Tailoring size" do
    visit tailoring_sizes_url
    click_on "Edit", match: :first

    click_on "Update Tailoring size"

    assert_text "Tailoring size was successfully updated"
    click_on "Back"
  end

  test "destroying a Tailoring size" do
    visit tailoring_sizes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tailoring size was successfully destroyed"
  end
end

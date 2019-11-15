require "application_system_test_case"

class TestPassesTest < ApplicationSystemTestCase
  setup do
    @test_pass = test_passes(:one)
  end

  test "visiting the index" do
    visit test_passes_url
    assert_selector "h1", text: "Test Passes"
  end

  test "creating a Test pass" do
    visit test_passes_url
    click_on "New Test Pass"

    click_on "Create Test pass"

    assert_text "Test pass was successfully created"
    click_on "Back"
  end

  test "updating a Test pass" do
    visit test_passes_url
    click_on "Edit", match: :first

    click_on "Update Test pass"

    assert_text "Test pass was successfully updated"
    click_on "Back"
  end

  test "destroying a Test pass" do
    visit test_passes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Test pass was successfully destroyed"
  end
end

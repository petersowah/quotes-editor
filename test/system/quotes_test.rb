require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  test "Creating a new quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_on "New Quote"
    assert_selector "h1", text: "New Quote"

    fill_in "Quote", with: "This is a quote"
    click_on "Create Quote"

    assert_selector "h1", text: "Quotes"
    assert_text "This is a quote"
  end

  test "Showing a quote" do
    visit quotes_path
    click_link @quote.name

    assert_selector "h1", text: @quote.name
  end

  test "Updating a quote" do
    visit quotes_path
    assert_selector "h1", text: "quotes"

    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit quote"

    fill_in "Name", with: "This is an updated quote"
    click_on "Update quote"

    assert_selector "h1", text: "Quotes"
    assert_text "This is an updated quote"
  end

  test "Deleting a quote" do
    visit quotes_path
    assert_text @quote.name

    click_on "Delete", match: :first
    assert_no_text @quote.name
  end
end

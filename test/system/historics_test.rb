require "application_system_test_case"

class HistoricsTest < ApplicationSystemTestCase
  setup do
    @historic = historics(:one)
  end

  test "visiting the index" do
    visit historics_url
    assert_selector "h1", text: "Historics"
  end

  test "creating a Historic" do
    visit historics_url
    click_on "New Historic"

    fill_in "Base", with: @historic.base
    fill_in "Date", with: @historic.date
    check "Historical" if @historic.historical
    fill_in "Rates", with: @historic.rates
    check "Success" if @historic.success
    fill_in "Timestamp", with: @historic.timestamp
    click_on "Create Historic"

    assert_text "Historic was successfully created"
    click_on "Back"
  end


end
